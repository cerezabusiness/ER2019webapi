class Api::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:postMessage]
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    # render json: @event
    respond_to do |format|
      format.json { render :show, status: :ok }
    end
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  def postMessage
    puts "env gmail: " + ENV["GMAIL_USERNAME"].to_s
    @event = Event.find(params[:event_id])
    #falta por hacer
    MessageMailer.consultation_mail(params[:name],params[:email],params[:consultation],@event.email).deliver_now
    render json: {operation: 1}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.permit(:name, :email, :phone,:consultation)
  end
end
