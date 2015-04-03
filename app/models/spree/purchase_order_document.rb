module Spree
  class PurchaseOrderDocument < ActiveRecord::Base
    has_many :payments, :as => :source
    belongs_to :payment_method

    delegate :actions, to: :payment_method
    # attr_accessible :number, :invoice_date, :contact_name, :contact_email, :attachment

    validates_presence_of :number,        :message => 'must be supplied.'
    validates_presence_of :contact_name,  :message => "can't be blank."
    validates_format_of   :contact_email, :with    => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    #, :message => "Your email doesn't appear to be valid."

    has_attached_file :attachment,
                      :url  => "purchase_orders/:id/:basename.:extension",
                      :path => "purchase_orders/:id/:basename.:extension"

    before_post_process :skip_thumbnail_creation

    ALLOWED_CONTENT_TYPES = [ "application/pdf" ]
    ALLOWED_FILE_EXTENSIONS = [ "pdf" ]


    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def source_required?
      true
    end

  private
    def skip_thumbnail_creation
      return false if (ALLOWED_CONTENT_TYPES.include?(attachment_content_type))
    end

  end
end
