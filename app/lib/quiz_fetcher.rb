class QuizFethcer
  def initialize(game, quizzes)
    @game ||= game
    @quiz_ids ||= quizzes
  end

  def get_question
    right = @game.right.split(',')
    wrong = @game.wrong.split(',')
    total = (right + wrong).map(&:to_i)

    left = @quiz_ids - total
    if left.size > 0
      {game: Api::V1::Quiz.find(left.sample)}
    else
      {game_over: {right: right.size, wrong: wrong.size}}
    end
  end
end
