class TicketJob < ApplicationJob
  queue_as :tickets

  def perform(raffle)
    CreateTicketsService.new(raffle).create_tickets
  end
end
