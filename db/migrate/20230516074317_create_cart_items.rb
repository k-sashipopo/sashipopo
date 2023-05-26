class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      
      #↓手動で追加↓#
      t.integer :item_id
      t.integer :customer_id
      t.integer :count
      #↑手動で追加↑#
      
      
    end
  end
end
