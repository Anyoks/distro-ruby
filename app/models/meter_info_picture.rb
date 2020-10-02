# == Schema Information
#
# Table name: meter_info_pictures
#
#  id            :uuid             not null, primary key
#  meter_info_id :uuid
#  picture       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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
