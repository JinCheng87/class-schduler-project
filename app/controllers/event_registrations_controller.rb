class EventRegistrationsController < ApplicationController
  def index

  end

  def new
    event = Event.find_by(id: params[:event_id])
    studio = Studio.find_by(id: event.studio_id)
    if event.users.ids.include?(current_user.id)
      flash[:notice] = "you've already signed up"
      redirect_to '/'
    elsif
      event.max_participants < event.users.count
      flash[:notice] = "This event is full"
      redirect_to '/'
    else
      event.users << current_user
      flash['notice'] = 'Successfully signed up!'
      redirect_to '/'
    end
  end

  def success

  end

  def registration_params
    params.permit(:user_id, :event_id)
  end
end