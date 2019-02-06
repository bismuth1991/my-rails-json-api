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

class Receipt < ApplicationRecord
  belongs_to :technician

  has_many :receipt_services
  has_many :services, through: :receipt_services
end
