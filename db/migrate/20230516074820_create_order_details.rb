class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      
      #↓手動で追加↓#
      t.integer :buy_quantity
      t.integer :tax_in_price
      t.integer :work_status, default: 0
      #↑手動で追加↑#
      
    end
  end
end
