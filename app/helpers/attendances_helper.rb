module AttendancesHelper
  def current_user_attend?(event_id, attendee_id)
    Attendance.find_by(event_id: event_id, attendee_id: attendee_id) != nil
  end
end
