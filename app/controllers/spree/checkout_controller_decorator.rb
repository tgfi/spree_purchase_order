module Spree
  CheckoutController.class_eval do
    before_filter :add_purchase_order, :only => [:update]

    def add_purchase_order
      return unless (params[:state] == "payment")
      return unless params[:order][:payments_attributes]

      payment_method = Spree::PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
      payment_parameters = params[:payment_source][payment_method.id.to_s]

      if payment_method.kind_of?(Spree::PaymentMethod::PurchaseOrder)
        invoice_date = Chronic.parse(payment_parameters[:invoice_date])
        payment_parameters[:invoice_date] = invoice_date.to_date if invoice_date.present?
      end
    end
  end
end