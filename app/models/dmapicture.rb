# == Schema Information
#
# Table name: dmapictures
#
#  id            :uuid             not null, primary key
#  dma_report_id :uuid
#  picture       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dmapicture < ApplicationRecord
  belongs_to :dma_report


  mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
