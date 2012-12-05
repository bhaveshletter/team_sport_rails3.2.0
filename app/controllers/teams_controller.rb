class TeamsController < ApplicationController

  def index
    @teams = Team.find(:all, :order => "wins")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end

  end

  def show
    @team = Team.find(params[:id])
    @team_players = @team.players
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end

  end

end
