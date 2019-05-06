class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  # GET /activities
  # GET /activities.json
  def index
    if @event != nil
      @activities = @event.activities.order(:start_time)
    else
      @activities = Activity.all
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    places_event = @event.places_events.where(place_id: activity_params[:place_id]).take

    @activity = Activity.new

    @activity.event_date_id = activity_params[:event_date_id]
    @activity.name = activity_params[:name]
    @activity.description = activity_params[:description]
    @activity.start_time = Time.local(activity_params["start_time(1i)"].to_i,
                                      activity_params["start_time(2i)"].to_i,
                                      activity_params["start_time(3i)"].to_i,
                                      activity_params["start_time(4i)"].to_i,
                                      activity_params["start_time(5i)"].to_i)

    @activity.end_time = Time.local(activity_params["end_time(1i)"].to_i,
                                    activity_params["end_time(2i)"].to_i,
                                    activity_params["end_time(3i)"].to_i,
                                    activity_params["end_time(4i)"].to_i,
                                    activity_params["end_time(5i)"].to_i)

    @activity.places_event_id = places_event.id

    redirect_to = [@event, @activity]

    respond_to do |format|
      if @activity.save()
        person = Person.find(activity_params[:person_id])
        @activity.people << person
        format.html { redirect_to redirect_to, notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    places_event = @event.places_events.where(place_id: activity_params[:place_id]).take

    @activity.event_date_id = activity_params[:event_date_id]
    @activity.name = activity_params[:name]
    @activity.description = activity_params[:description]
    @activity.start_time = Time.local(activity_params["start_time(1i)"].to_i,
                                      activity_params["start_time(2i)"].to_i,
                                      activity_params["start_time(3i)"].to_i,
                                      activity_params["start_time(4i)"].to_i,
                                      activity_params["start_time(5i)"].to_i)

    @activity.end_time = Time.local(activity_params["end_time(1i)"].to_i,
                                    activity_params["end_time(2i)"].to_i,
                                    activity_params["end_time(3i)"].to_i,
                                    activity_params["end_time(4i)"].to_i,
                                    activity_params["end_time(5i)"].to_i)

    @activity.places_event_id = places_event.id

    respond_to do |format|
      if @activity.save()
        person = Person.find(activity_params[:person_id])
        if @activity.people.empty?
          @activity.people << person
        else
          @activity.activities_people.take.update(person_id: person.id)
        end
        format.html { redirect_to [@event, @activity], notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to [@event, :activities], notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_event
    begin
      @event = Event.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:place_id, :person_id, :name, :description, :start_time, :end_time, :event_date_id, :places_event_id)
  end
end
