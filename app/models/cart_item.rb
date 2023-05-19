class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  def subtotal
    item.tax_free_price * count
  end

#   def self.cart_items_total_price(cart_items)
#     array = []
#     cart_items.each do |cart_item|
#       array << cart_item.item.tax_free_price * cart_item.count
#     end
#     return (array.sum * 1.1).floor
#   end
end
