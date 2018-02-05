class AddTaxIdFields < ActiveRecord::Migration
  def change
    add_column :spree_purchase_order_documents, :tax_exempt, :boolean, default: true, null: false
    add_column :spree_purchase_order_documents, :tax_id_number, :string

    Spree::PurchaseOrderDocument.update_all tax_exempt: false
  end
end
