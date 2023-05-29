class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
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
