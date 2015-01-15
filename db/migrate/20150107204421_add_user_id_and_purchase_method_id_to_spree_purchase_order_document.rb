class AddUserIdAndPurchaseMethodIdToSpreePurchaseOrderDocument < ActiveRecord::Migration
  def change
    add_column :spree_purchase_order_documents, :payment_method_id, :integer
    add_column :spree_purchase_order_documents, :user_id, :integer

    add_index :spree_purchase_order_documents, :payment_method_id
    add_index :spree_purchase_order_documents, :user_id
  end
end
