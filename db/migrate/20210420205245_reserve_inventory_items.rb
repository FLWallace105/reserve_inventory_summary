class ReserveInventoryItems < ActiveRecord::Migration[6.1]
  def change
    ##<CSV::Row "product_id":"4626731925562" "variant_id":"32223473303610" "product_title":"Maxine Jacket (Desert Sage)" "variant_title":"L" "sku":"745934270180" "total_reserve_inventory_obligations":"6" "received_from_CIMS":"0" "shopify_adjustment":"-6" "add_back_pad":"0">
    create_table :summary_reserve_inventory do |t|
      t.string :product_id
      t.string :variant_id
      t.string :product_title
      t.string :variant_title
      t.string :sku
      t.bigint :total_reserve_inventory_obligations
      t.bigint :received_from_cims
      t.bigint :shopify_adjustment
      t.bigint :add_back_pad
      t.datetime :inventory_updated
      
      
    end

  end
end
