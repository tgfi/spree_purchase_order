Deface::Override.new(:virtual_path  => %q{spree/checkout/edit},
                     :name          => %q{add_multipart_to_form},
                     :replace       => %q{code[erb-loud]:contains('form_for')},
                     :disabled      => false,
                     :text          => %q{<%= form_for @order, :url => update_checkout_path(@order.state), :html => { :id => "checkout_form_#{@order.state}", :multipart => (@order.state == 'payment') } do |form| %> })