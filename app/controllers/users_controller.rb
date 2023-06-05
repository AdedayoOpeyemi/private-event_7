class UsersController < ApplicationController
  def show
    @user = current_user
    @events = current_user.events
    # @attended_events = current_user.attended_events
    @past_attended_events = current_user.attended_events.past_events
    @future_attended_events = current_user.attended_events.future_events
  end
end
