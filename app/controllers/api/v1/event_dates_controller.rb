class Api::V1::EventDatesController < ApplicationController
  before_action :set_event_date, only: [:show, :update, :destroy]
  before_action :set_event
  # GET /event_dates
  def index
    if @event != nil
      @event_dates = @event.event_dates.order(:date)
    else
      @event_dates = EventDate.all
    end
    render json: @event_dates
  end

  # GET /event_dates/1
  def show
    render json: @event_date
  end

  # POST /event_dates
  def create
    @event_date = EventDate.new(event_date_params)

    if @event_date.save
      render json: @event_date, status: :created, location: @event_date
    else
      render json: @event_date.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_dates/1
  def update
    if @event_date.update(event_date_params)
      render json: @event_date
    else
      render json: @event_date.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_dates/1
  def destroy
    @event_date.destroy
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

  # Only allow a trusted parameter "white list" through.
  def event_date_params
    params.require(:event_date).permit(:date, :event_id)
  end
end
