class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /api/v1/games.json
  def index
    @games = Api::V1::Game.all
  end

  # GET /api/v1/games/1.json
  def show
  end

  # PATCH/PUT /api/v1/games/1.json
  def update
    if @game.update(game_params)
      render :show, status: :ok, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end


  private

  def set_game
    @game = Api::V1::Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:right, :wrong)
  end
end
