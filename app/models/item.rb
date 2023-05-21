class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :intro, presence: true
  validates :tax_free_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :image, presence: true
  validates :sale_status, inclusion: {in: [true, false]}

  # 税込価格を求めるメソッド
  def with_tax_price
    (tax_free_price * 1.1).floor
  end

end
