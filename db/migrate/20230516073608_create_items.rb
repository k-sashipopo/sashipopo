class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      
      #↓手動で追加↓#
      t.string :name
      t.integer :tax_free_price
      t.text :intro
      t.boolean :sale_status,  default: false
      #↑手動で追加↑#
      
      
    end
  end
end
