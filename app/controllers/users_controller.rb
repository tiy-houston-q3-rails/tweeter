class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def follow
    them = User.find(params[:user_id])
    current_user.follow!(them)
    redirect_to users_path
  end

end
