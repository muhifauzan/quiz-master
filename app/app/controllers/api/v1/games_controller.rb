class Api::V1::GamesController < ApplicationController
  before_action :set_api_v1_game, only: [:show, :update, :destroy]

  # GET /api/v1/games
  # GET /api/v1/games.json
  def index
    @api_v1_games = Api::V1::Game.all
  end

  # GET /api/v1/games/1
  # GET /api/v1/games/1.json
  def show
  end

  # POST /api/v1/games
  # POST /api/v1/games.json
  def create
    @api_v1_game = Api::V1::Game.new(api_v1_game_params)

    if @api_v1_game.save
      render :show, status: :created, location: @api_v1_game
    else
      render json: @api_v1_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/games/1
  # PATCH/PUT /api/v1/games/1.json
  def update
    if @api_v1_game.update(api_v1_game_params)
      render :show, status: :ok, location: @api_v1_game
    else
      render json: @api_v1_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/games/1
  # DELETE /api/v1/games/1.json
  def destroy
    @api_v1_game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_game
      @api_v1_game = Api::V1::Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_game_params
      params.require(:api_v1_game).permit(:right, :wrong)
    end
end
