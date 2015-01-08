module Spree
  class PaymentMethod::PurchaseOrder < PaymentMethod

    def payment_source_class
      Spree::PurchaseOrderDocument
    end

    def actions
      %w{void}
    end

    def authorize(money, credit_card, options = {})
      ActiveMerchant::Billing::Response.new(true, 'Purchase Order: Success', {}, {})
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      false
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def cancel(response); end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def source_required?
      true
    end
  end
end
