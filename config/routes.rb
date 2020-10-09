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
   namespace :users do
  	resources :foods
    resources :nonfoods
    resources :users, only: [:show, :edit, :update]
   end
   root 'home#top'
end
