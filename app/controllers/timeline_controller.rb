class TimelineController < ApplicationController

  before_action :authenticate_user!

  def show
    @messages = Timeline.new(current_user).messages
  end

end
