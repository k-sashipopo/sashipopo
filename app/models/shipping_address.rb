class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :postcode, presence:true, length: { is: 7 }
  validates :address, presence:true
  validates :name, presence:true
  
  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end

end
