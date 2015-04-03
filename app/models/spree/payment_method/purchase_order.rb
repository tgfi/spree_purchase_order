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

    def capture(*args)
      ActiveMerchant::Billing::Response.new(true, 'Purchase Order: Success', {}, {})
    end

    def authorize(money, purchase_order_instance, options = {})
      ActiveMerchant::Billing::Response.new(true, 'Purchase Order: Success', {}, {})
    end

    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      !payment.state.in?(['void', 'invalid', 'failed'])
    end

    def source_required?
      true
    end

    def supports?(source)
      source.class.in?([Spree::PurchaseOrderDocument])
    end

    def payment_profiles_supported?
      true
    end
  end
end
