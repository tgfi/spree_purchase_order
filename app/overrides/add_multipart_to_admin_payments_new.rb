Deface::Override.new(:virtual_path  => %q{spree/admin/payments/new},
                     :name          => %q{add_multipart_to_admin_payments_new},
                     :replace       => %q{erb[loud]:contains('form_for')},
                     :disabled      => false,
                     :original      => %q{ <%= form_for @payment, :url => admin_order_payments_path(@order) do |f| %> },
                     :text          => %q{ <%= form_for @payment, :url => admin_order_payments_path(@order), :html => { :multipart => true } do |f| %>})