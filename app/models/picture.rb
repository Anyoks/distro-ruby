class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader # using carrier wave
  belongs_to :report

  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
