class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :kind
  has_many :ticket, dependent: :destroy
  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :awards, reject_if: :all_blank, allow_destroy: true
  validates :awards, presence: true

  def to_s
    title
  end
end
