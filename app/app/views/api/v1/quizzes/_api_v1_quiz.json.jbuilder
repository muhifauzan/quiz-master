json.extract! api_v1_quiz, :id, :question, :answer, :created_at, :updated_at
json.url api_v1_quiz_url(api_v1_quiz, format: :json)
