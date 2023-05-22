class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  # 小計を求めるメソッド
  def subtotal
    self.item.with_tax_price * self.count
  end
end
