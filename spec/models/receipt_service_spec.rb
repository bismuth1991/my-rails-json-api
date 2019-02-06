# == Schema Information
#
# Table name: receipt_services
#
#  id         :bigint(8)        not null, primary key
#  receipt_id :integer          not null
#  service_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ReceiptService, type: :model do
  it { should belong_to(:receipt) }
  it { should belong_to(:service) }
end

