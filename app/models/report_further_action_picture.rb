# == Schema Information
#
# Table name: report_further_action_pictures
#
#  id                       :uuid             not null, primary key
#  report_further_action_id :uuid
#  picture                  :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class ReportFurtherActionPicture < ApplicationRecord
  belongs_to :report_further_action


  mount_uploader :picture, PictureUploader # using carrier wave
 
  def filename
    self.picture.file.filename
  end

  def url
    self.picture.url
  end
end
