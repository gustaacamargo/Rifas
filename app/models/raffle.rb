class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :kind
  has_many :tickets, dependent: :destroy
  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :awards, reject_if: :all_blank, allow_destroy: true
  validate :at_least_one_award

  def to_s
    title
  end

  private
  def at_least_one_award
    # when creating a new contact: making sure at least one team exists
    return errors.add :base, "Must have at least one award" unless awards.length > 0

    # when updating an existing contact: Making sure that at least one team would exist
    return errors.add :base, "Must have at least one award" if awards.reject{|awards| awards._destroy == true}.empty?
  end  
end
