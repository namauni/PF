Rails.application.routes.draw do
  
devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    #resources :sessions, only: [:new, :create, :destroy]
    resources :contents, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
    resources :questions, only: [:index, :destroy]
    resources :questions_comments, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end

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
  get "users/:id/content_index" => "users#content_index",as: "content_index"
  get 'users/:id/questions_index' =>"users#questions_index",as: "questions_index"
  get 'questions/arrivalorder'
  get 'questions_comments', to: 'questions_comments#index'
  resources :questions, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :questions_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit,:update] do
    resource :relationships, only:[:create, :destroy]
  
    get 'follows' => 'relationships#followed'
    get 'followers' => 'relationships#follower'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
