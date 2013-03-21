module Spree
  CheckoutController.class_eval do
    before_filter :add_purchase_order, :only => [:update]

    def add_purchase_order
      return unless (params[:state] == "payment")
      return unless params[:order][:payments_attributes]

      load_order

      payment_method     = Spree::PaymentMethod.find(params[:order][:payments_attributes].first[:payment_method_id])
      payment_parameters = params[:payment_source][payment_method.id.to_s]

      if payment_method.kind_of?(Spree::PaymentMethod::PurchaseOrder)
        Spree::PurchaseOrderDocument.create(:number        => payment_parameters[:number],
                                            :invoice_date  => payment_parameters[:invoice_date],
                                            :contact_name  => payment_parameters[:contact_name],
                                            :contact_email => payment_parameters[:contact_email],
                                            :attachment    => payment_parameters[:attachment]
          )
      end
    end
  end
end