module AttendancesHelper
    def attend_unattend(event)
        return attend_path(event) unless user_signed_in?

        if current_user.attending_event?(event)
          unattend_path(event)
        else
          attend_path(event)
        end
    end

    def attend_unattend_text(event)
      return 'Attend' unless user_signed_in?
    
      if current_user.attending_event?(event)
        'Unattend'
      else
        'Attend'
      end

    end
end
