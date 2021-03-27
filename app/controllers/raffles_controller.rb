class RafflesController < ApplicationController
  before_action :set_raffle, only: %i[ show edit update destroy ]

  # GET /raffles or /raffles.json
  def index
    @raffles = Raffle.all
  end

  # GET /raffles/1 or /raffles/1.json
  def show
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
  end

  # GET /raffles/1/edit
  def edit
  end

  # POST /raffles or /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)

    respond_to do |format|
      if @raffle.save
        format.html { redirect_to @raffle, notice: "Raffle was successfully created." }
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      @raffle = Raffle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def raffle_params
      params.require(:raffle).permit(:user_id, :kind_id, :title, :description, :probable_raffle_date, :start_date_sale, :end_date_sale, :date_raffle, :ticket_value)
    end
end
