class InvitationsController < ApplicationController
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

  private

  def invitation_params
    params.require(:invitation).permit(user_ids: [])
  end
end
