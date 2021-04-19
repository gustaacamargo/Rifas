class Api::V1::RafflesController < Api::V1::ApplicationController
  before_action :authenticate_user!
  before_action :set_raffle, only: [:raffle]

  def raffle
    @ids = []
    
    if @raffle.nil?
      render json: {error: "No tickets buyed", status: "error"}, status: :unprocessable_entity
    elsif @raffle.tickets.length < @raffle.awards.length
      render json: {error: "Tickets buyed insufficient to realize the raffle", status: "error"}, status: :unprocessable_entity
    else
      @raffle.tickets.each { |ticket| @ids << ticket.id }

      @ids_raffled = []
      index_raffled = Random.rand(@ids.length)
      @raffle.awards.each do |award|
        while @ids_raffled.include? index_raffled
          index_raffled = Random.rand(@ids.length)
        end
        @ids_raffled << index_raffled
        award.ticket_id = @ids[index_raffled]

        award.save
      end
      @raffle.date_raffle = Time.zone.now
      @raffle.save

      render :raffle, status: :ok, raffle: @raffle
    end
  end

  private
  def set_raffle
    @raffle = Raffle.includes(:tickets, { awards: [ { ticket: [:user] }] }).where("raffles.id = ? and tickets.user_id is not null and raffles.user_id = ?", params[:id], current_user.id).references(:tickets)[0]
  end
end
