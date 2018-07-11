Rails.application.routes.draw do
  root to: 'site#index'

  namespace :api do
    namespace :v1 do
      resource :games, only: [:show, :update]

      resources :quizzes
    end
  end
end
