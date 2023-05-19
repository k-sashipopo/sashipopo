class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  
  # 税込価格を求めるメソッド
  def with_tax_price
    (tax_free_price * 1.1).floor.to_s(:delimited)
  end
  
  # 小計を求めるメソッド
  def subtotal
    self.with_tax_price * count.to_s(:delimited)
  end
  
end
