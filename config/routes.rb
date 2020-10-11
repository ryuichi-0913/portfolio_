Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  	namespace :admin do
      get 'home/about'
  	end

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
    root 'home#top'
    post 'users/follow/:id' => 'relationships#follow', as: 'follow' # フォローする
    post 'users/unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
    get "user/follow" => "users/users#follow"
    get "user/followed" => "users/users#followed"
    get 'food_comment/new'
      namespace :users do


        resources :users, only: [:show, :edit, :update]
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
