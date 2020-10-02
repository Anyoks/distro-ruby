# == Schema Information
#
# Table name: anomally_pictures
#
#  id          :uuid             not null, primary key
#  anomally_id :uuid
#  picture     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnomallyPicture < ApplicationRecord
  belongs_to :anomally

    mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
