class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_profiles, only: [:new, :edit]
  before_action :set_event
  before_action :set_model, only: [:show, :edit]
  # GET /people
  # GET /people.json
  def index
    if @event != nil
      @people = @event.people.all
    else
      @people = Person.all
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    if @event != nil
      @person = @event.people.create(person_params)
      redirect_to = [@event, @person]
    else
      @person = Person.create(person_params)
      redirect_to = @person
    end

    respond_to do |format|
      if @person.valid?
        if @event != nil
          @person.persons_events.where(event_id: @event.id).take.update(profile_id: 2)
        end
        format.html { redirect_to redirect_to, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    redirect_to = @event != nil ? [@event, @place] : @place

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    redirect_to = @event != nil ? [@event, :people] : people_url
    @person.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_model
    @model = @event == nil ? @place : [@event, @place]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  def set_profiles
    @profiles = Profile.all
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:name, :picture, :description, :phone, :email, :city_id, :company_id, :title)
  end
end
