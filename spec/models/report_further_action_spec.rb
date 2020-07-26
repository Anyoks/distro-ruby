# == Schema Information
#
# Table name: report_further_actions
#
#  id                 :uuid             not null, primary key
#  zone_report_id     :uuid
#  dma_report_id      :uuid
#  account_report_id  :uuid
#  relocate_meter     :boolean
#  raise_meter        :boolean
#  replace_meter      :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  remark             :string
#  action_taken       :boolean
#  other              :string
#  disconnection_type :string
#  repairs_done       :string
#

require 'rails_helper'

RSpec.describe ReportFurtherAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
