class AttendancesController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
  
    def create
        @attendance = Attendance.new
        @attendance.event_attendee_id = params[:attendance][:event_attendee_id]
        @attendance.attended_event_id = params[:attendance][:attended_event_id]

        respond_to do |format|
            if @attendance.save
                format.html { redirect_to @attendance.attended_event, notice: "You have joined the event." }
                # format.json { render :show, status: :created, location: @attendance.attended_event }
            else
                format.html { redirect_to @attendance.attended_event, status: :unprocessable_entity }
                format.json { render json: @attendance.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @signup = Signup.find(params[:id])
        @event = @signup.attended_event
        @signup.destroy

        redirect_to @event
    end
end
