class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @past_events = Event.past_events
    @future_events = Event.future_events
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :time)
  end

end
