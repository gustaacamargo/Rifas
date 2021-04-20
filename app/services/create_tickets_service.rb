require 'active_record'
require_relative '../models/ticket.rb'

class CreateTicketsService
    def initialize(raffle)
      @raffle = raffle
      @kind = raffle.kind
    end
  
    def create_tickets
      count = 0
      number = @kind.initial_number
      while count < @kind.number_of_tickets do
        @ticket = Ticket.new
        @ticket.raffle = @raffle
        @ticket.number = number
        @ticket.save
        number += @kind.step
        count += 1
      end
    end
  end