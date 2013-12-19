class TimekeepersController < ApplicationController
  before_action :set_timekeeper, only: [:show, :edit, :update, :destroy]

  # GET /timekeepers
  def index
    @timekeepers = Timekeeper.all
  end

  # GET /timekeepers/1
  def show
  end

  # GET /timekeepers/new
  def new
    @timekeeper = Timekeeper.new
  end

  # GET /timekeepers/1/edit
  def edit
  end

  # POST /timekeepers
  def create
    @timekeeper = Timekeeper.new(timekeeper_params)

    if @timekeeper.save
      sign_in @timekeeper
      redirect_to @timekeeper, notice: 'Timekeeper was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /timekeepers/1
  def update
    if @timekeeper.update(timekeeper_params)
      redirect_to @timekeeper, notice: 'Timekeeper was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /timekeepers/1
  def destroy
    @timekeeper.destroy
    redirect_to timekeepers_url, notice: 'Timekeeper was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timekeeper
      @timekeeper = Timekeeper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timekeeper_params
      params.require(:timekeeper).permit(:login, :password, :club_id)
    end
end
