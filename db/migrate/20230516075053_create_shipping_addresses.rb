class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|

      t.timestamps
      
      
      #↓手動で追加↓#
      t.string :name
      t.string :address
      t.string :postcode
      #↑手動で追加↑#

      
    end
  end
end
