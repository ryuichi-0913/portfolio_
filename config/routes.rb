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
get 'food_comment/new'
   namespace :users do
  	resources :foods do
    resource :food_favorites, only: [:create, :destroy]
    resources :food_comments, only: [:create, :destroy]
    end
    resources :nonfoods do
     resource :nonfood_favorites, only: [:create, :destroy]
     resources :nonfood_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
   end
   root 'home#top'
end
