Rails.application.routes.draw do
  get 'users/show'
  #deviseを使用する際にURLにusersが含むことを示している
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'users' => 'users#users'
  resources :books, only: [:edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :update]
end
