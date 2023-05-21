class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :intro, presence: true
  validates :genre_id, presence: true
  validates :tax_free_price, presence: true
  validates :sale_status, presence: true
  validates :image, presence: true

  # 税込価格を求めるメソッド
  def with_tax_price
    (tax_free_price * 1.1).floor
  end

end
