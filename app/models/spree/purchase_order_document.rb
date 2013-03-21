module Spree
  class PurchaseOrderDocument < ActiveRecord::Base
    has_many :payments, :as => :source
    attr_accessible :number, :invoice_date, :contact_name, :contact_email, :attachment

    validates_presence_of :number,        :message => 'You must supply a purchase order number.'
    validates_presence_of :contact_name,  :message => "The billing contact name can't be blank."
    validates_format_of   :contact_email, :with    => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Your email doesn't appear to be valid."

    has_attached_file :attachment,
                      :url  => "purchase_orders/:id/:basename.:extension",
                      :path => "purchase_orders/:id/:basename.:extension"

    before_post_process :skip_thumbnail_creation

    include Spree::Core::S3Support
    supports_s3 :attachment

    ALLOWED_CONTENT_TYPES = [ "application/pdf" ]
    ALLOWED_FILE_EXTENSIONS = [ "pdf" ]

    private
    def skip_thumbnail_creation
      return false if (ALLOWED_CONTENT_TYPES.include?(attachment_content_type))
    end
  end
end
