class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to teams_url
    else
      flash.now[:errors] = @team.errors.full_messages
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.attributes = params[:team]
    if @team.save
      redirect_to team_url(@team)
    else
      flash.now[:errors] = @team.errors.full_messages
      render :edit
    end
  end
end
