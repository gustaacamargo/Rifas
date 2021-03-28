require 'active_record'
require_relative '../models/ticket.rb'

class TicketJob < ApplicationJob
  queue_as :tickets

  def perform(id)
    for i in 0..1000 do
      @ticket = Ticket.new
      @ticket.raffle = Raffle.find(id)
      @ticket.number = i
      @ticket.save
    end
  end
end
