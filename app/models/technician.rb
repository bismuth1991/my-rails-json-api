# == Schema Information
#
# Table name: technicians
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  pin_number :integer          not null
#  admin      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Technician < ApplicationRecord
  validates :name, presence: true
  validates :pin_number, presence: true, :inclusion => { :in => 1000..9999, message: "PIN must be a 4-digit number" }

  has_many :receipts
end
