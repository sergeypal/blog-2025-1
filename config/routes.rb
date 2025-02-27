Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # Задаём route для корня сайта
  root "articles#index"

  # маршруты /articles/*
  resources :articles do # CRUD (create, show, update, destroy) для статей
    # маршруты /articles/:article_id/comments/*
    resources :comments, only: [:create, :destroy] do # ТОЛЬКО create и destroy для комментариев к статьям
      # маршруты /articles/:article_id/comments/:comment_id/like_comments/*
      resources :like_comments, only: [:create, :destroy], shallow: true # ТОЛЬКО create и destroy для лайков к комментариям
    end
    # маршруты /articles/:article_id/like_articles/*
    resources :like_articles, only: [:create, :destroy] # ТОЛЬКО create и destroy для лайков к статьями
  end
end
