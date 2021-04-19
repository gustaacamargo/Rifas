class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :user, optional: true
  has_one :award

  def to_s
    number.to_s
  end
end
