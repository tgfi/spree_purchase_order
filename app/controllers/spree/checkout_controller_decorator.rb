module Spree
  CheckoutController.class_eval do
    before_filter :add_purchase_order, :only => [:update]

    def add_purchase_order
      return unless (params[:state] == "payment")
      return unless params[:order][:payments_attributes]

      payment_method     = Spree::PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
      payment_parameters = params[:payment_source][payment_method.id.to_s]

      if payment_method.kind_of?(Spree::PaymentMethod::PurchaseOrder)
        invoice_date = Chronic.parse(payment_parameters[:invoice_date])
        invoice_date = invoice_date.to_date if invoice_date.present?
        Spree::PurchaseOrderDocument.create(:number        => payment_parameters[:number],
                                            :invoice_date  => invoice_date,
                                            :contact_name  => payment_parameters[:contact_name],
                                            :contact_email => payment_parameters[:contact_email],
                                            :attachment    => payment_parameters[:attachment],
                                            :tax_exempt    => payment_parameters[:tax_exempt],
                                            :tax_id_number => payment_parameters[:tax_id_number]
          )

      end
    end
  end
end
