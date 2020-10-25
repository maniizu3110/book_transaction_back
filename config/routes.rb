Rails.application.routes.draw do
  
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  get 'confirm/:id',to: 'relationships#confirm?'
  put 'complete/:id',to: 'books#complete'
  get 'orders/:id',to: 'books#order'
  
  # get :users, to: "users#index"
  # get :user, to: "users#point"
  # post :users/:id/update, to: "users#update"
  # urlにカテゴリーを入れて検索できるようにする :categoryで受けとる
  # resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:create]
  resources :registrations,only:[:create]
  resources :books
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create,:destroy,:show]
  
end
