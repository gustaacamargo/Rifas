class Award < ApplicationRecord
  belongs_to :raffle
  belongs_to :ticket
end
