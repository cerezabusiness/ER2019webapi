class Api::V1::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]
  before_action :set_event
  # GET /places
  def index
    if @event != nil
      @places = @event.places.all
    else
      @places = Place.all
    end

    render json: @places
  end

  # GET /places/1
  def show
    render json: @place
  end

  # POST /places
  def create
    if @event != nil
      @place = @event.places().create(place_params)
    else
      @place = Place.create(place_params)
    end
    if @place.valid?
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Only allow a trusted parameter "white list" through.
  def place_params
    params.require(:place).permit(:name, :address, :city_id)
  end
end
