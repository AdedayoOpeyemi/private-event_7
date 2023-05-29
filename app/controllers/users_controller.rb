class UsersController < ApplicationController
  def show
    @user = current_user
    @events = current_user.events
  end
end
