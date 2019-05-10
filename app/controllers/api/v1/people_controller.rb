class Api::V1::PeopleController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_person, only: [:show, :update, :destroy]
  before_action :set_event
  # GET /people
  def index
    if @event != nil
      @people = @event.people.all
    else
      @people = Person.all
    end

    render json: @people, include: { :company => { :only => :name } }
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new
    company_id = person_params[:company_id]
    if company_id < 1
      company = Company.create(name: person_params[:company_name])
      company_id = company.id
    end
    @person.name = person_params[:name]
    @person.email = person_params[:email]
    @person.company_id = person_params[:company_id]
    @person.phone = person_params[:phone]

    if @person.save
      @person.persons_events.where(event_id: @event.id).take.update(profile_id: 1)
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def person_params
    params.require(:person).permit(:name, :picture, :description, :phone, :email, :company_name, :city_id, :company_id, :title)
  end
end
