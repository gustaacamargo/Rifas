class HomeController < ApplicationController
  def index
    @your_raffles = current_user.raffles.order(probable_raffle_date: :desc)

    @raffled_not_tickets = current_user.tickets.includes(:award).joins(:raffle).where('date_raffle is NULL').group('tickets.id')
    @raffled_tickets = current_user.tickets.includes(:award).joins(:raffle).where('date_raffle is not NULL').group('tickets.id')

    @total_ticket_value = current_user.tickets.joins(:raffle).sum(:ticket_value)
    @purchased_tickets = current_user.tickets.size
  end
end
