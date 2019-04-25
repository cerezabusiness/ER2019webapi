class MultimediaTypesController < ApplicationController
  before_action :set_multimedia_type, only: [:show, :edit, :update, :destroy]

  # GET /multimedia_types
  # GET /multimedia_types.json
  def index
    @multimedia_types = MultimediaType.all
  end

  # GET /multimedia_types/1
  # GET /multimedia_types/1.json
  def show
  end

  # GET /multimedia_types/new
  def new
    @multimedia_type = MultimediaType.new
  end

  # GET /multimedia_types/1/edit
  def edit
  end

  # POST /multimedia_types
  # POST /multimedia_types.json
  def create
    @multimedia_type = MultimediaType.new(multimedia_type_params)

    respond_to do |format|
      if @multimedia_type.save
        format.html { redirect_to @multimedia_type, notice: 'Multimedia type was successfully created.' }
        format.json { render :show, status: :created, location: @multimedia_type }
      else
        format.html { render :new }
        format.json { render json: @multimedia_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia_types/1
  # PATCH/PUT /multimedia_types/1.json
  def update
    respond_to do |format|
      if @multimedia_type.update(multimedia_type_params)
        format.html { redirect_to @multimedia_type, notice: 'Multimedia type was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedia_type }
      else
        format.html { render :edit }
        format.json { render json: @multimedia_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia_types/1
  # DELETE /multimedia_types/1.json
  def destroy
    @multimedia_type.destroy
    respond_to do |format|
      format.html { redirect_to multimedia_types_url, notice: 'Multimedia type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedia_type
      @multimedia_type = MultimediaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimedia_type_params
      params.require(:multimedia_type).permit(:multimedia_type)
    end
end
