class CreateSpreePurchaseOrder < ActiveRecord::Migration
  def change
    create_table :spree_purchase_order_documents do |t|
      t.string :number
      t.date   :invoice_date
      t.string :contact_name
      t.string :contact_email
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.string :attachment_file_size
      t.timestamps
    end
    add_index :spree_purchase_order_documents, [:number, :invoice_date]
  end
end
