class HomeController < ApplicationController
  def index
    @raffled_not_tickets = current_user.tickets.includes(:award).joins(:raffle).where('probable_raffle_date > ?', DateTime.now).group('tickets.id')
    @raffled_tickets = current_user.tickets.includes(:award).joins(:raffle).where('probable_raffle_date < ?', DateTime.now).group('tickets.id')

    @total_ticket_value = current_user.tickets.joins(:raffle).sum(:ticket_value)
    @purchased_tickets = current_user.tickets.size
  end
end
