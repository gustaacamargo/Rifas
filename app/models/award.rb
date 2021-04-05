class Award < ApplicationRecord
  belongs_to :raffle
  belongs_to :ticket, optional: true
end
