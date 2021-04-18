class RafflesController < ApplicationController
  before_action :set_raffle_with_user, only: %i[ edit update destroy ]
  before_action :set_raffle, only: %i[ show ]

  # GET /raffles or /raffles.json
  def index
    @raffles = Raffle.all.includes(:user, :kind, :tickets, :awards)
  end

  # GET /raffles/1 or /raffles/1.json
  def show
    @tickets = @raffle.tickets.order(:number).paginate(page: params[:page], per_page: 100)
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
    @raffle.awards.build
  end

  # GET /raffles/1/edit
  def edit
  end

  # POST /raffles or /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)
    @raffle.user = current_user

    respond_to do |format|
      if @raffle.save
        format.html { redirect_to @raffle, notice: "Raffle was successfully created." }
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end

    TicketJob.perform_later(@raffle.id,  @raffle.kind)
  end

  # PATCH/PUT /raffles/1 or /raffles/1.json
  def update
    respond_to do |format|
      if @raffle.update(raffle_params)
        format.html { redirect_to @raffle, notice: "Raffle was successfully updated." }
        format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffles/1 or /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html { redirect_to raffles_url, notice: "Raffle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def modal
    @raffle = Raffle.includes(:tickets).find_by(id: params[:id])
    @ticket = Ticket.find_by(id: params[:ticketId].to_i)

    render :modal, layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      @raffle = Raffle.includes(:tickets, :awards).find_by(id: params[:id])
    end

    def set_raffle_with_user
      @raffle = Raffle.includes(:tickets, :awards).find_by({id: params[:id], user: current_user.id})
      unless @raffle
        redirect_to root_path, alert: "You don't have permission to do this!"
      end
    end

    # Only allow a list of trusted parameters through.
    def raffle_params
      params.require(:raffle).permit(:user_id, :kind_id, :title, :description, :probable_raffle_date, :start_date_sale, :end_date_sale, :date_raffle, :ticket_value,
        awards_attributes: [:id, :description, :placing, :_destroy]
      )
    end
end
