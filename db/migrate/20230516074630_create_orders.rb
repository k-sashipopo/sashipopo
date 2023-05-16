class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      
      #↓手動で追加↓#
      t.integer :total_price
      t.integer :pay_option, default: 0
      t.integer :status, default: 0
      t.integer :postage
      t.string :delivery_name
      t.string :delivery_address
      t.string :delivery_postcode
      #↑手動で追加↑#
      
    end
  end
end
