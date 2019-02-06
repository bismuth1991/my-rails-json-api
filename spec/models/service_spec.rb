# == Schema Information
#
# Table name: services
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "name validations" do
    before { Service.create(name: "Manicure", price: 15) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  it { should validate_presence_of(:price) }

  it { should have_many(:receipts) }
end
