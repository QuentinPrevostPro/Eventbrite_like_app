class Admin::EventsController < ApplicationController

  def index
  end
  def update
    if params[:validation] == "true"
      puts "ok"
      Event.find(params[:id]).update(:validated => true)
    else
      puts "nok"
      Event.find(params[:id]).update(:validated => false)
    end
    redirect_to admin_events_path
  end
end