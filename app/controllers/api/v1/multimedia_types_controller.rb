class Api::V1::MultimediaTypesController < ApplicationController
  before_action :set_multimedia_type, only: [:show, :update, :destroy]

  # GET /multimedia_types
  def index
    @multimedia_types = MultimediaType.all

    render json: @multimedia_types
  end

  # GET /multimedia_types/1
  def show
    render json: @multimedia_type
  end

  # POST /multimedia_types
  def create
    @multimedia_type = MultimediaType.new(multimedia_type_params)

    if @multimedia_type.save
      render json: @multimedia_type, status: :created, location: @multimedia_type
    else
      render json: @multimedia_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /multimedia_types/1
  def update
    if @multimedia_type.update(multimedia_type_params)
      render json: @multimedia_type
    else
      render json: @multimedia_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /multimedia_types/1
  def destroy
    @multimedia_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedia_type
      @multimedia_type = MultimediaType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def multimedia_type_params
      params.require(:multimedia_type).permit(:multimedia_type)
    end
end
