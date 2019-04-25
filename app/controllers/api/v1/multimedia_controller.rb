class Api::V1::MultimediaController < ApplicationController
  before_action :set_multimedium, only: [:show, :update, :destroy]

  # GET /multimedia
  def index
    @multimedia = Multimedium.all

    render json: @multimedia
  end

  # GET /multimedia/1
  def show
    render json: @multimedium
  end

  # POST /multimedia
  def create
    @multimedium = Multimedium.new(multimedium_params)

    if @multimedium.save
      render json: @multimedium, status: :created, location: @multimedium
    else
      render json: @multimedium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /multimedia/1
  def update
    if @multimedium.update(multimedium_params)
      render json: @multimedium
    else
      render json: @multimedium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /multimedia/1
  def destroy
    @multimedium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedium
      @multimedium = Multimedium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def multimedium_params
      params.require(:multimedium).permit(:name, :url, :multimedia_type_id, :event_id)
    end
end
