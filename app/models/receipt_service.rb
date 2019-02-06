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

class ReceiptService < ApplicationRecord
  belongs_to :service 
  belongs_to :receipt
end
