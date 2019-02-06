# == Schema Information
#
# Table name: receipts
#
#  id            :bigint(8)        not null, primary key
#  technician_id :integer          not null
#  cash          :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Receipt, type: :model do
  it { should belong_to(:technician) }
end
