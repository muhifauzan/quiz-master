Api::V1::Quiz.destroy_all
Api::V1::Quiz.create(question: '1 + 1', answer: 'two')
Api::V1::Quiz.create(question: '2 + 2', answer: 'four')
Api::V1::Quiz.create(question: '3 + 3', answer: 'six')

Api::V1::Game.create
