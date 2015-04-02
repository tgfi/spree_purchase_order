module Spree
  class PaymentMethod::PurchaseOrder < PaymentMethod

    def payment_source_class
      Spree::PurchaseOrderDocument
    end

    def actions
      %w{capture void}
    end

    def cancel(response); end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def capture(*args)
      ActiveMerchant::Billing::Response.new(true, 'Purchase Order: Success', {}, {})
    end

    def source_required?
      false
    end
  end
end
