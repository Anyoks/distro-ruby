class MeterInfoPicture < ApplicationRecord
  belongs_to :meter_info

    mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
