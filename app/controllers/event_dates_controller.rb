class EventDatesController < ApplicationController
  before_action :set_event_date, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  # GET /event_dates
  # GET /event_dates.json
  def index
    if @event != nil
      @event_dates = @event.event_dates.all
    else
      @event_dates = EventDate.all
    end
  end

  # GET /event_dates/1
  # GET /event_dates/1.json
  def show
  end

  # GET /event_dates/new
  def new
    @event_date = EventDate.new
  end

  # GET /event_dates/1/edit
  def edit
  end

  # POST /event_dates
  # POST /event_dates.json
  def create
    if @event != nil
      @event_date = @event.event_dates.create(event_date_params)
    else
      @event_date = EventDate.create(event_date_params)
    end

    respond_to do |format|
      if @event_date.valid?
        format.html { redirect_to [@event, @event_date], notice: "Event date was successfully created." }
        format.json { render :show, status: :created, location: @event_date }
      else
        format.html { render :new }
        format.json { render json: @event_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_dates/1
  # PATCH/PUT /event_dates/1.json
  def update
    respond_to do |format|
      if @event_date.update(event_date_params)
        format.html { redirect_to [@event, @event_date], notice: "Event date was successfully updated." }
        format.json { render :show, status: :ok, location: @event_date }
      else
        format.html { render :edit }
        format.json { render json: @event_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_dates/1
  # DELETE /event_dates/1.json
  def destroy
    @event_date.destroy
    respond_to do |format|
      format.html { redirect_to event_event_dates_path, notice: "Event date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecrodNotFound
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event_date
    @event_date = EventDate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_date_params
    params.require(:event_date).permit(:date, :event_id)
  end
end
