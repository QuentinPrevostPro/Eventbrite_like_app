class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!, only: [:new]

  def index
  end
  def show
  end
  def new
  end
  def create
    @event = Event.new(start_date: params[:start_date], title: params[:title], duration: params[:duration], admin_id: params[:admin_id], description: params[:description], price: params[:price], location: params[:location], validated: params[:validated])
    @event.image.attach(params[:image])
    if @event.save
      redirect_to events_path
    else
      redirect_to events_path
    end
  end
  def edit
    @event = event_by_id(params[:id])
  end
  def update
    @event = event_by_id(params[:id])
    if @event.update(start_date: params[:start_date], title: params[:title], duration: params[:duration], description: params[:description], price: params[:price], location: params[:location])
      redirect_to event_path(params[:id])
    else
      redirect_to events_path
    end
  end
  def destroy
    @event = event_by_id(params[:id])
    @event.destroy
    redirect_to events_path
  end
end

