class Api::V1::ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]
  before_action :set_event
  # GET /activities
  def index
    if @event != nil
      @activities = @event.activities.all
    else
      @activities = Activity.all
    end
    render json: @activities
  end

  # GET /activities/1
  def show
    render json: @activity
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Only allow a trusted parameter "white list" through.
  def activity_params
    params.require(:activity).permit(:name, :description, :date, :time_range_id, :places_event_id)
  end
end
