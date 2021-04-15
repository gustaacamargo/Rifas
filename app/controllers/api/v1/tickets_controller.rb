class Api::V1::TicketsController < Api::V1::ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:buy]

  def buy
    if @ticket.update(user: current_user)
      render :buy, status: :ok, ticket: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
