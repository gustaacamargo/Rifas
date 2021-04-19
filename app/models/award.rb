class Award < ApplicationRecord
  belongs_to :raffle
  belongs_to :ticket, optional: true

  def to_s
    description
  end
end
