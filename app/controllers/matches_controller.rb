class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match
  end

  def new
    match = Match.new
  end

  def create
    match = Match.create(
      match_date: params[:match][:match_date],
      location_id: params[:match][location_id],
      player1: params[:match][:player1],
      player2: params[:match][:player2],
      winner: params[:match][:winner],
      loser: params[:match][:loser]
    )

    redirect_to 
  end

  def update
    @match.update(
      match_date: params[:match][:match_date],
      location_id: params[:match][location_id],
      player1: params[:match][:player1],
      player2: params[:match][:player2],
      winner: params[:match][:winner],
      loser: params[:match][:loser]
    )

    redirect_to match_path(match)
  end

  def edit
    @match
  end

  def destroy
    @match.destroy
  end
end
