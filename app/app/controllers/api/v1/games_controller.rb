class Api::V1::GamesController < ApplicationController
  before_action :set_game

  def show
    quizzes = Api::V1::Quiz.all.pluck(:id)

    render :json, status: :ok, game: QuizFethcer.new(@game, quizzes).get_question
  end

  def update
    quiz = Api::V1::Quiz.find(game_params.fetch(:quiz_id))
    result = GameCalculator.new(@game, quiz, game_params.fetch(:answer)).latest_result

    if @game.update(result)
      render :show, status: :ok, game: result.right?
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end


  private

  def set_game
    @game = Api::V1::Game.first
  end

  def game_params
    params.require(:game).permit(:quiz_id, :answer)
  end
end
