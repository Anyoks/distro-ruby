class BurstAndLealage < ApplicationRecord
  belongs_to :zone_report
  belongs_to :dma_report
  belongs_to :pipematerial
  belongs_to :pipesize

  has_many :burst_pictures
  has_many :land_mark_pictures

end
