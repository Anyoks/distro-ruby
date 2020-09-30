# == Schema Information
#
# Table name: zonepictures
#
#  id             :uuid             not null, primary key
#  zone_report_id :uuid
#  picture        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Zonepicture < ApplicationRecord
  belongs_to :zone_report


  mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
