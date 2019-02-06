# == Schema Information
#
# Table name: technicians
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  pin_number :string           not null
#  admin      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Technician, type: :model do
  it { should validate_presence_of(:name) }

  describe "pin_number validation" do
    it { should validate_presence_of(:pin_number) }
    it { should validate_inclusion_of(:pin_number).in_range(1000..9999).with_message("PIN must be a 4-digit number") }
  end

  it { should have_many(:receipts) }
end
