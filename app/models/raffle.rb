class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :kind
end
