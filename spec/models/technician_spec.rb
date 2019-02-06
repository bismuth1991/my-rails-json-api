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
    it { should validate_numericality_of(:pin_number).is_less_than(10000) }
    it { should validate_numericality_of(:pin_number).is_greater_than(999) }
  end

  it { should have_many(:receipts) }
end
