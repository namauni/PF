Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
devise_for :users
root to: 'homes#top'
get '/home/about' => 'homes#about',as: "about"
resources :contents, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
