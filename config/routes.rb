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
     resources :food_comments
    end
    resources :nonfoods
    resources :users, only: [:show, :edit, :update]
   end
   root 'home#top'
end
