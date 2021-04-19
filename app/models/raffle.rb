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

  def datetime_now 
    datetime_now = DateTime.parse(Time.now.to_s).strftime('%Y%m%d%H%M%S')
  end

  def started_sale?
    date_of_start_sale = DateTime.parse(start_date_sale.to_s).strftime('%Y%m%d%H%M%S')
    date_of_start_sale > datetime_now
  end

  def closed_sale?
    date_of_end_sale = DateTime.parse(end_date_sale.to_s).strftime('%Y%m%d%H%M%S')
    date_of_end_sale > datetime_now
  end

  def draw_allowed?
    date_of_probable_raffle = DateTime.parse(probable_raffle_date.to_s).strftime('%Y%m%d%H%M%S')
    date_of_probable_raffle < datetime_now && date_raffle.nil?
  end

  private
  def at_least_one_award
    # when creating a new contact: making sure at least one team exists
    return errors.add :base, "Must have at least one award" unless awards.length > 0

    # when updating an existing contact: Making sure that at least one team would exist
    return errors.add :base, "Must have at least one award" if awards.reject{|awards| awards._destroy == true}.empty?
  end  
end
