json.extract! quiz, :id, :question, :answer, :created_at, :updated_at
json.url api_v1_quiz_url(quiz, format: :json)
