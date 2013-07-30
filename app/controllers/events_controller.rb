class EventsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:index, :show]

  # GET /events
  # GET /events.json
  def index
    @published_events = Event.where(status: "Publish")
    @draft_events = Event.where(status: "Draft")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # This page actually saves the attendance to the database
  def attendance
    @event = Event.find(params[:id])
    @user = User.find_by_email(params[:email])

    respond_to do |format|
      if @user.nil?
        format.html { redirect_to attend_event_path(@event), alert: 'There was an error submitting your attendance.' }
      else
        @user.attend(@event)
        format.html { redirect_to attend_event_path(@event), notice: 'Your attendance was successfully submitted.' }
      end
    end
  end

  # This page sets up the email form
  def attend
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def calendar
  end
end
