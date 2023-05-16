class OrderDetail < ApplicationRecord

  #0着手不可/1製作待ち/2制作中/3製作完了
 enum work_status: { not_make: 0, wait_make: 1, now_make: 2, complete_make: 3}


end
