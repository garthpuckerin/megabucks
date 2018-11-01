class LocationsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  
  def index
    @locations = Location.all
  end

  def show
    @location
    @matches = Match.where(location_id: params[:id])
  end

  def edit
    @location
  end

  def update
    @location.update(
      name: params[:location][:name],
      address: params[:location][:address],
      phone: params[:location][:phone],
      match_day: params[:location][:match_day]
    )

    redirect_to location_path(location)
  end

  def destroy
    @location.destroy

    # respond_to do |format|
    #   format.html
    #   format.js
    # end

    redirect_to locations_path
  end

  def new
    @location = Location.new
  end

  def create
    location = Location.create(
      name: params[:location][:name],
      address: params[:location][:address],
      phone: params[:location][:phone],
      match_day: params[:location][:match_day]
      )

    redirect_to locations_path
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

end
