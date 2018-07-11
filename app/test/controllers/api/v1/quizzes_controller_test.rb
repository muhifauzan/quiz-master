require 'test_helper'

class Api::V1::QuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_quiz = api_v1_quizzes(:one)
  end

  test "should get index" do
    get api_v1_quizzes_url, as: :json
    assert_response :success
  end

  test "should create api_v1_quiz" do
    assert_difference('Api::V1::Quiz.count') do
      post api_v1_quizzes_url, params: { api_v1_quiz: { answer: @api_v1_quiz.answer, question: @api_v1_quiz.question } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_quiz" do
    get api_v1_quiz_url(@api_v1_quiz), as: :json
    assert_response :success
  end

  test "should update api_v1_quiz" do
    patch api_v1_quiz_url(@api_v1_quiz), params: { api_v1_quiz: { answer: @api_v1_quiz.answer, question: @api_v1_quiz.question } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_quiz" do
    assert_difference('Api::V1::Quiz.count', -1) do
      delete api_v1_quiz_url(@api_v1_quiz), as: :json
    end

    assert_response 204
  end
end
