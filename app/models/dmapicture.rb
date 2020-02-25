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
