class EventsController < ApplicationController
  before_action :find_studio
  before_action :find_event, except: [:new, :create, :index]
  def new
    event = @studio.events.new
    render :new, locals: { studio: @studio, event: event}
  end

  def index
    events = @studio.events.all
    render :index, locals: { studio: @studio, events: events }
  end

  def create
    event = @studio.events.new(event_params)
    if event.save
      redirect_to studio_event_path(@studio,event)
    else
      render :new, locals: { studio: @studio, event: event }
    end
  end

  def show
    render :show, locals: { event: @event, studio: @studio }
  end

  def edit
    render :edit, locals: { event: @event, studio: @studio }
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to studio_event_path(@studio, @event)
    else
      render :edit, locals: { event: @event, studio: @studio }
    end
  end

  def destroy
    @event.destroy
    redirect_to studio_events_path(@studio)
  end


  private

  def find_studio
    @studio = Studio.find_by(id: params[:studio_id])
  rescue ActiveRecord::RecordNotFound
    render :'error/not_found', status: :not_found
  end

  def find_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :'error/not_found', status: :not_found
  end

  def event_params
    params.require(:event).permit(:title, :starts_at, :ends_at, :max_participants, :description, :studio_id)
  end
end