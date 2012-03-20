class CreateAssetsChainMailItems < ActiveRecord::Migration
  def self.up
    create_table :chain_mail_items_chain_mail_materials, :id => false do |t|
      t.integer :chain_mail_item_id
      t.integer :chain_mail_material_id
    end
  end

  def self.down
    drop_table :assets_chain_mail_items
  end
end
