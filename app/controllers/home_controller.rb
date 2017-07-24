class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    events = current_user.events
    render :index, locals: { events: events }
  end
end