require 'rails_helper'

RSpec.describe ReceiptService, type: :model do
  it { should belong_to(:receipt) }
  it { should belong_to(:service) }
end

