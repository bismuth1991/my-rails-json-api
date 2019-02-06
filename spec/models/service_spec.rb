require 'rails_helper'

RSpec.describe Service, type: :model do
  describe "name validations" do
    let { Service.create(name: "Manicure", price: 15) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  it { should validate_presence_of(:price) }
end
