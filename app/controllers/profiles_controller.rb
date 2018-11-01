class ProfilesController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # before_action :set_location, only: [:show, :edit, :update, :destroy]
  # before_action :set_matches, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
    # @profile
    @matches = Match.where(player1: params[:id]).or(Match.where(player2: params[:id]))
    @p1wins = Match.where(player1: params[:id], p1_result: "Won")
    @p2wins = Match.where(player2: params[:id], p2_result: "Won")
    @totalWins = @p1wins.count + @p2wins.count
    @p1losses = Match.where(player1: params[:id], p1_result: "Loss")
    @p2losses = Match.where(player2: params[:id], p2_result: "Loss")
    @totalLosses = @p1losses.count + @p2losses.count

    @totalWinsPoints = @totalWins * 10
    @totalLossesPoints = @totalLosses * 5
    @totalPoints = (@totalWins * 10) + (@totalLosses * 5)

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

  # def set_location
  #   @location = Location.find(params[:id])
  # end

  # def set_matches
  #   @matches = Match.where()
  # end
end
