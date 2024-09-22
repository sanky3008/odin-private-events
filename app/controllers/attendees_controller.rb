class AttendeesController < ApplicationController
  def create
    puts params.inspect
    @attendee = Attendee.create!(attendee_params)

    if @attendee.save
      redirect_to root_path, notice: 'You are now attending this event.'
    else
      puts @attendee.errors.full_messages  # This will print errors to your server log
      redirect_to events_path, alert: "Unable to attend this event: #{@attendee.errors.full_messages.join(', ')}"
    end
  end

  private
  def attendee_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
