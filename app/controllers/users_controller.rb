class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @events = @user.attended_events
  end
end
