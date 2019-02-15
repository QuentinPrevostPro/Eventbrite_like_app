module EventsHelper
  def event_by_id(id)
    Event.find(id) 
  end
end
