class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :check_permission, only: [:edit, :update, :destroy]

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

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.creator == current_user
      @event.destroy
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Post created successfully."
      flash[:alert] = "An error occurred while creating the post."
      redirect_to root_path, alert: 'You are not permittd to make this change'
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :time, :invite_only)
  end

  def check_permission
    @event = Event.find(params[:id])
    if @event.creator != current_user
      flash[:alert] = "You are unauthorized"
      redirect_to root_path, alert: 'You are not permittd to make this change'
    end
  end

end
