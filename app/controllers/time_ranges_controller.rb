class TimeRangesController < ApplicationController
  before_action :set_time_range, only: [:show, :edit, :update, :destroy]

  # GET /time_ranges
  # GET /time_ranges.json
  def index
    @time_ranges = TimeRange.all
  end

  # GET /time_ranges/1
  # GET /time_ranges/1.json
  def show
  end

  # GET /time_ranges/new
  def new
    @time_range = TimeRange.new
  end

  # GET /time_ranges/1/edit
  def edit
  end

  # POST /time_ranges
  # POST /time_ranges.json
  def create
    @time_range = TimeRange.new(time_range_params)

    respond_to do |format|
      if @time_range.save
        format.html { redirect_to @time_range, notice: 'Time range was successfully created.' }
        format.json { render :show, status: :created, location: @time_range }
      else
        format.html { render :new }
        format.json { render json: @time_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_ranges/1
  # PATCH/PUT /time_ranges/1.json
  def update
    respond_to do |format|
      if @time_range.update(time_range_params)
        format.html { redirect_to @time_range, notice: 'Time range was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_range }
      else
        format.html { render :edit }
        format.json { render json: @time_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_ranges/1
  # DELETE /time_ranges/1.json
  def destroy
    @time_range.destroy
    respond_to do |format|
      format.html { redirect_to time_ranges_url, notice: 'Time range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_range
      @time_range = TimeRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_range_params
      params.require(:time_range).permit(:start_time, :end_time)
    end
end
