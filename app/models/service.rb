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

class Service < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  has_many :receipt_services
  has_many :receipts, through: :receipt_services
end
