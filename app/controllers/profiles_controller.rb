class ProfilesController < ApplicationController

  def index
    @profile = User.offset(rand(User.count)).first
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:tag_list, :about_me, :current_project, :github_repo)
  end

end
