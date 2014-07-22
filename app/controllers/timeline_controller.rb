class TimelineController < ApplicationController

  before_action :authenticate_user!

  def show
    @messages = Timeline.new(current_user).messages
  end

  def search
    @messages = Search.new.messages(params[:search]).order("created_at DESC")
  end

end
