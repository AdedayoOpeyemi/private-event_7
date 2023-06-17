class InvitationsController < ApplicationController
  before_action :check_permission, only: [:edit, :update, :destroy]
  # def new
  #   @event = Event.find(params[:event_id])
  #   @invitation = Invitation.new
  # end

  def create
    @event = Event.find(params[:event_id])
    invitation_params[:user_ids].each do |user_id|
      @invitation = Invitation.new(user_id: user_id)
      @invitation.event = @event
      @invitation.save
    end

    redirect_to @event, notice: 'Invitations sent successfully!'
  end

  def accept_invitation

  end

  def decline_invitation
  end

  private

  def invitation_params
    params.require(:invitation).permit(user_ids: [])
  end

  def check_permission
    @event = Event.find(params[:event_id])
    if @event.creator != current_user
      flash[:alert] = "You are unauthorized"
      redirect_to root_path, alert: 'You are not permittd to send invitations out'
    end
  end

  def permitted_to_accept_decline
    # @invitation = 
  end
end
