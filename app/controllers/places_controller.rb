class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  # GET /places
  # GET /places.json
  def index
    if @event != nil
      @places = @event.places.all
    else
      @places = Place.all
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    if @event == nil
      @model = @place
    else
      @model = [@event, @place]
    end
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    if @event == nil
      @model = @place
    else
      @model = [@event, @place]
    end
  end

  # POST /places
  # POST /places.json
  def create
    if @event != nil
      @place = @event.places().create(place_params)
      redirect_to = [@event, @place]
    else
      @place = Place.create(place_params)
      redirect_to = @place
    end

    respond_to do |format|
      if @place.valid?
        format.html { redirect_to redirect_to, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if @event != nil
      redirect_to = [@event, @place]
    else
      redirect_to = @place
    end
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to redirect_to, notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:name, :address, :city_id)
  end
end
