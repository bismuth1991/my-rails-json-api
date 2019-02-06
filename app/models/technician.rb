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

class Technician < ApplicationRecord
  has_many :receipts
end
