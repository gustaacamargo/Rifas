class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :kind
  has_many :ticket, dependent: :delete_all
end
