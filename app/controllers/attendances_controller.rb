class AttendancesController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_event, only: %i[attend unattend] 

    def attend
        @event.attendees << current_user unless @event.attendees.exists?(current_user.id)

        redirect_to events_path
    end

    def unattend
        @event.attendees.delete(current_user) if @event.attendees.exists?(current_user.id)

        redirect_to events_path
    end

    private

  # Use callbacks to share common setup or constraints between actions.
    def set_event
        @event = Event.find(params[:event_id])
        puts @event
    end
end
