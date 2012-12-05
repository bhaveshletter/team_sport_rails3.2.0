class PlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  def show
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

end
