class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  # 小計を求めるメソッド
  def subtotal
    self.with_tax_price * count.to_s(:delimited)
  end

#   def self.cart_items_total_price(cart_items)
#     array = []
#     cart_items.each do |cart_item|
#       array << cart_item.item.tax_free_price * cart_item.count
#     end
#     return (array.sum * 1.1).floor
#   end
end
