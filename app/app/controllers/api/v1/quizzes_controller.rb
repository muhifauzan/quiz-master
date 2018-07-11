class Api::V1::QuizzesController < ApplicationController
  before_action :set_api_v1_quiz, only: [:show, :update, :destroy]

  # GET /api/v1/quizzes
  # GET /api/v1/quizzes.json
  def index
    @api_v1_quizzes = Api::V1::Quiz.all
  end

  # GET /api/v1/quizzes/1
  # GET /api/v1/quizzes/1.json
  def show
  end

  # POST /api/v1/quizzes
  # POST /api/v1/quizzes.json
  def create
    @api_v1_quiz = Api::V1::Quiz.new(api_v1_quiz_params)

    if @api_v1_quiz.save
      render :show, status: :created, location: @api_v1_quiz
    else
      render json: @api_v1_quiz.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/quizzes/1
  # PATCH/PUT /api/v1/quizzes/1.json
  def update
    if @api_v1_quiz.update(api_v1_quiz_params)
      render :show, status: :ok, location: @api_v1_quiz
    else
      render json: @api_v1_quiz.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/quizzes/1
  # DELETE /api/v1/quizzes/1.json
  def destroy
    @api_v1_quiz.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_quiz
      @api_v1_quiz = Api::V1::Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_quiz_params
      params.require(:api_v1_quiz).permit(:question, :answer)
    end
end
