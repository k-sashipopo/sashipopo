class Order < ApplicationRecord

  #0クレカ/1現金
  enum pay_option: { credit_card: 0, transfer: 1 }

  #0入金待ち/1入金確認/2製作中/3発送準備中/4発送済み
  enum status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }

end
