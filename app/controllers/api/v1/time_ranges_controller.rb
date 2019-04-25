class Api::V1::TimeRangesController < ApplicationController
  before_action :set_time_range, only: [:show, :update, :destroy]

  # GET /time_ranges
  def index
    @time_ranges = TimeRange.all

    render json: @time_ranges
  end

  # GET /time_ranges/1
  def show
    render json: @time_range
  end

  # POST /time_ranges
  def create
    @time_range = TimeRange.new(time_range_params)

    if @time_range.save
      render json: @time_range, status: :created, location: @time_range
    else
      render json: @time_range.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_ranges/1
  def update
    if @time_range.update(time_range_params)
      render json: @time_range
    else
      render json: @time_range.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_ranges/1
  def destroy
    @time_range.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_range
      @time_range = TimeRange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_range_params
      params.require(:time_range).permit(:start_time, :end_time)
    end
end
