# == Schema Information
#
# Table name: pictures
#
#  id         :uuid             not null, primary key
#  report_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#

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
