# == Schema Information
#
# Table name: burst_pictures
#
#  id                   :uuid             not null, primary key
#  burst_and_lealage_id :uuid
#  picture              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

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
