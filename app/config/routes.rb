Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games
    end
  end
  namespace :api do
    namespace :v1 do
      resources :quizzes
    end
  end
end
