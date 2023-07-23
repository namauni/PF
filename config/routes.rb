Rails.application.routes.draw do
  
  get 'questions/new'

  devise_for :users
    devise_scope :user do
      post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
  root to: 'homes#top'
  get '/home/about' => 'homes#about',as: "about"
  
  get 'contents/arrivalorder'
  get 'comments', to: 'comments#index'
  resources :contents, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :questions, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :questions_comments, only: [:create, :destroy, :index]
  end
  get 'users/contents_index'
  get 'users/questions_index'
  resources :users, only: [:show, :edit,:update] do
    resource :relationships, only:[:create, :destroy]
  
    get 'follows' => 'relationships#followed'
    get 'followers' => 'relationships#follower'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
