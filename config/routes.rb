Rails.application.routes.draw do
  devise_for :admins,
      controllers: {
        sessions: 'admins/sessions',
        passwords: 'admins/passwords',
        registrations: 'admins/registrations',
  }

	namespace :admins do
    get 'home/about'
    resources :contacts
	end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'home#top'
  post 'users/follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'users/unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get "user/follow/:id" => "users/users#follow", as:'user_follow'
  get "user/followed:id" => "users/users#followed", as:'user_followed'
  get 'food_comment/new'
  get '/search' => 'search#search', as: 'search'

  namespace :users do
    get 'users/userallpost'
    get 'users/favolist'

    resources :users
    resources :contacts
  	resources :foods do
      resource :food_favorites, only: [:create, :destroy]
      resources :food_comments, only: [:create, :destroy]
    end
    resources :nonfoods do
      resource :nonfood_favorites, only: [:create, :destroy]
      resources :nonfood_comments, only: [:create, :destroy]
    end
  end

end
