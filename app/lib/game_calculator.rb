class GameCalculator
  def initialize(game, quiz, answer)
    @game ||= game
    @quiz ||= quiz
    @answer ||= answer.humanize
  end

  def latest_result
    if right?
      {right: @game.right + ",#{@quiz.id}"}
    else
      {wrong: @game.wrong + ",#{@quiz.id}"}
    end
  end

  def right?
    @answer == @quiz.answer
  end
end
