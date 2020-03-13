class BurstPicture < ApplicationRecord
  belongs_to :burst_and_lealage

    mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
