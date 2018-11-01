class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = Match.all
    p1wins = Match.where(p1_result: "Won")
    p1wins.count
    puts '////////'
    puts p1wins.count
  end

  def show
    @match
    # p1wins = Match.where(p1_result: "Won")
    # p1wins.count
    # puts '////////'
    # p "#{ p1wins.count }"
  end

  def new
    match = Match.new
  end

  def create
    match = Match.create(
      match_date: params[:match][:match_date],
      location_id: params[:match][:location_id],
      match_format: params[:match][:match_format],
      match_type: params[:match][:match_type],
      player1: params[:match][:player1],
      player2: params[:match][:player2],
      winner: params[:match][:p1_results],
      loser: params[:match][:p2_results]
    )

    redirect_to matches_path
  end

  def update
    @match.update(
      match_date: params[:match][:match_date],
      location_id: params[:match][:location_id],
      match_format: params[:match][:match_format],
      match_type: params[:match][:match_type],
      player1: params[:match][:player1],
      player2: params[:match][:player2],
      winner: params[:match][:p1_results],
      loser: params[:match][:p2_results]
    )

    redirect_to match_path(match)
  end

  def edit
    @match
  end

  def destroy
    @match.destroy
  end

  def import
    Match.import(params[:file])

    redirect_to matches_path, notice: "Matches Added Successfully"
  end


  def wins
    p1wins = Match.where(p1_result: "Won")
    p1wins.count
    # puts '////////////////'
    # puts p1wins.count
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end
end
