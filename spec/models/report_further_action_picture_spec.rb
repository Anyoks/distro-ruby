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

require 'rails_helper'

RSpec.describe ReportFurtherActionPicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
