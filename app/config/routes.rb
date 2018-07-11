Rails.application.routes.draw do
  root to: 'site#index'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show, :update]

      resources :quizzes
    end
  end
end
