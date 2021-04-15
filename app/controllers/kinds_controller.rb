class KindsController < ApplicationController
  before_action :authorize_admin, :set_kind, only: %i[ show new create edit update destroy ]
  skip_before_action :authenticate_user!, only: [:index]

  # GET /kinds or /kinds.json
  def index
    @kinds = Kind.all
  end

  # GET /kinds/1 or /kinds/1.json
  def show
  end

  # GET /kinds/new
  def new
    @kind = Kind.new
  end

  # GET /kinds/1/edit
  def edit
  end

  # POST /kinds or /kinds.json
  def create
    @kind = Kind.new(kind_params)

    respond_to do |format|
      if @kind.save
        format.html { redirect_to @kind, notice: "Kind was successfully created." }
        format.json { render :show, status: :created, location: @kind }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kinds/1 or /kinds/1.json
  def update
    respond_to do |format|
      if @kind.update(kind_params)
        format.html { redirect_to @kind, notice: "Kind was successfully updated." }
        format.json { render :show, status: :ok, location: @kind }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kinds/1 or /kinds/1.json
  def destroy
    @kind.destroy
    respond_to do |format|
      format.html { redirect_to kinds_url, notice: "Kind was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.require(:kind).permit(:description, :initial_number, :step, :number_of_tickets)
    end

    def authorize_admin
      return unless :is_admin?
      redirect_to root_path, alert: 'Admins only!'
    end
end
