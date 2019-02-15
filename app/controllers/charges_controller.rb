class ChargesController < ApplicationController
  include EventsHelper
  
  def create
    
    # Amount in cents
    @amount = event_by_id(params[:event_id]).price*100
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
  
  @attendance = Attendance.new(stripe_customer_id: params[:stripeToken], event_id: params[:event_id], attendee_id: current_user.id)
  if @attendance.save
    flash[:success] = "Enregistré avec succès"
    puts "OK"
    redirect_to event_path(params[:event_id])
  else
    flash[:danger] = "Erreur dans l'enregistrement'"
    puts "NOK"
    redirect_to event_path(params[:event_id])
  end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_event_charge_path
end
  
end
