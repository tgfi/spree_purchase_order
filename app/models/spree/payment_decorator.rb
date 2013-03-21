Spree::Payment.class_eval do
  attr_accessible :source, :source_type, :number, :contact_email, :contact_name, :invoice_date

  def po?
    return true if payment_method.type == 'Spree::PaymentMethod::PurchaseOrder'
  end
end