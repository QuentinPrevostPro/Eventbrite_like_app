class EventsController < ApplicationController
  def index
  end
  def new
  end
  def create
    @event = Event.new(start_date: params[:start_date], title: params[:title], duration: params[:duration], admin_id: params[:admin_id], description: params[:description], price: params[:price], location: params[:location])
    if @event.save
      redirect_to events_path
    else
      redirect_to events_path
    end
  end
end
