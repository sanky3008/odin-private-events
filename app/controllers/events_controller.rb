class EventsController < ApplicationController
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)

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
end
