class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  before_action :set_model, only: [:show, :edit]
  # GET /information
  # GET /information.json
  def index
    @information = @event != nil ? @event.information.all : Information.all
  end

  # GET /information/1
  # GET /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = @information = @event != nil ? @event.information.create(information_params) : Information.create(information_params)

    respond_to do |format|
      if @information.valid?
        format.html { redirect_to [@event, @information], notice: "Information was successfully created." }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to [@event, @information], notice: "Information was successfully updated." }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to [@event, :information_index], notice: "Information was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_model
    @model = @event == nil ? @place : [@event, @place]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_information
    @information = Information.find(params[:id])
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def information_params
    params.require(:information).permit(:title, :content, :event_id)
  end
end
