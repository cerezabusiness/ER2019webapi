class MultimediaController < ApplicationController
  before_action :set_multimedium, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  before_action :set_multimedia_types, only: [:edit, :new]
  # GET /multimedia
  # GET /multimedia.json
  def index
    if @event != nil
      @multimedia = @event.multimedia.all
    else
      @multimedia = Multimedium.all
    end
  end

  # GET /multimedia/1
  # GET /multimedia/1.json
  def show
  end

  # GET /multimedia/new
  def new
    @multimedium = Multimedium.new
  end

  # GET /multimedia/1/edit
  def edit
  end

  # POST /multimedia
  # POST /multimedia.json
  def create
    if @event != nil
      @multimedium = @event.multimedia.create(multimedium_params)
    else
      @multimedium = Multimedium.create(multimedium_params)
    end
    
    respond_to do |format|
      if @multimedium.valid?
        format.html { redirect_to [@event, @multimedium], notice: "Multimedium was successfully created." }
        format.json { render :show, status: :created, location: @multimedium }
      else
        format.html { render :new }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia/1
  # PATCH/PUT /multimedia/1.json
  def update
    respond_to do |format|
      if @multimedium.update(multimedium_params)
        format.html { redirect_to [@event, @multimedium], notice: "Multimedium was successfully updated." }
        format.json { render :show, status: :ok, location: @multimedium }
      else
        format.html { render :edit }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia/1
  # DELETE /multimedia/1.json
  def destroy
    @multimedium.destroy
    respond_to do |format|
      format.html { redirect_to [@event, :multimedia], notice: "Multimedium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_multimedium
    @multimedium = Multimedium.find(params[:id])
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  def set_multimedia_types
    @multimedia_types = MultimediaType.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def multimedium_params
    params.require(:multimedium).permit(:name, :url, :multimedia_type_id, :event_id)
  end
end
