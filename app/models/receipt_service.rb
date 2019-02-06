class ReceiptService < ApplicationRecord
  belongs_to :service 
  belongs_to :receipt
end
