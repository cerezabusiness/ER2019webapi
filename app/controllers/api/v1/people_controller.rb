class Api::V1::PeopleController < ApplicationController
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
    @person = Person.new(person_params)

    if @person.save
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
    params.require(:person).permit(:name, :picture, :description, :phone, :email, :city_id, :company_id, :title)
  end
end
