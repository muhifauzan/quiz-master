class Api::V1::QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :update, :destroy]

  # GET /api/v1/quizzes.json
  def index
    @quizzes = Api::V1::Quiz.all
  end

  # GET /api/v1/quizzes/1.json
  def show
  end

  # POST /api/v1/quizzes.json
  def create
    @quiz = Api::V1::Quiz.new(quiz_params)

    if @quiz.save
      render :show, status: :created, location: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/quizzes/1.json
  def update
    if @quiz.update(quiz_params)
      render :show, status: :ok, location: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/quizzes/1.json
  def destroy
    @quiz.destroy
  end


  private

  def set_quiz
    @quiz = Api::V1::Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:question, :answer)
  end
end
