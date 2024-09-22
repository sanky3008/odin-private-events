class EventsController < ApplicationController
  def index
    @events_past = Event.past.all.order(created_at: :desc)
    @events_upcoming = Event.upcoming.all.order(created_at: :desc)
  end

  def new
    @event = current_user.created_events.new
  end

  def show
    @event = Event.find(show_params[:id])
    @attendees = @event.users
  end

  def create
    @event = current_user.created_events.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :location)
  end

  def show_params
    params.permit(:id)
  end
end
