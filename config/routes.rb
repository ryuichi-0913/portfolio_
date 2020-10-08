Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  	namespace :admin do
  	    get 'top' => 'homes#top', as: 'top'
  	end




  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
   namespace :users do
  	resources :foods

	  root 'home#top'
   end
end
