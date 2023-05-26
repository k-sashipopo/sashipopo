class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :count, numericality: { less_than_or_equal_to: 10 }


  # 小計を求めるメソッド
  def subtotal
    self.item.with_tax_price * self.count
  end
end
