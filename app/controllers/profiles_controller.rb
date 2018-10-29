class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile
  end

  def new
    profile = Profile.new
  end

  def create
    profile = Profile.create(
      first_name: params[:profile][:first_name],
      last_name: params[:profile][:last_name],
      handicap: params[:profile][:handicap],
      location_id: params[:profile][location_id],
      # user_id: params[:profile][:user_id]
    )

    redirect_to profiles_path
  end

  def update
    @profile.update(
      first_name: params[:profile][:first_name],
      last_name: params[:profile][:last_name],
      handicap: params[:profile][:handicap],
      location_id: params[:profile][location_id],
      # user_id: params[:profile][:user_id]
    )
  
    redirect_to profile_path(profile)
  end

  def edit
    @profile
  end

  def destroy
    @profile.destroy

    redirect_to profiles_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
