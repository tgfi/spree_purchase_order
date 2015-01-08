module SpreePurchaseOrder
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_purchase_order'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::PaymentMethod::PurchaseOrder
    end

    initializer "spree.set.payment_attributes.permitted_params" do |app|
      Spree::PermittedAttributes.source_attributes << :invoice_date
      Spree::PermittedAttributes.source_attributes << :contact_name
      Spree::PermittedAttributes.source_attributes << :contact_email
      Spree::PermittedAttributes.source_attributes << :upload_pdf
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
