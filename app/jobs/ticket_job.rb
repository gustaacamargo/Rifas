require 'active_record'
require_relative '../models/ticket.rb'

class TicketJob < ApplicationJob
  queue_as :tickets

  def perform(id, kind)
    count = 0
    number = kind.initial_number
    while count < kind.number_of_tickets do
      @ticket = Ticket.new
      @ticket.raffle = Raffle.find(id)
      @ticket.number = number
      @ticket.save
      number += kind.step
      count += 1
    end
  end
end
