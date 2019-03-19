Rails.application.routes.draw do
  get 'sessions/new'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users
 resources :products

 get 'signup', to: 'signup#new'
 post 'signup', to: 'signup#create'

 get 'signin', to: 'session#new'
 post 'signin', to: 'session#create'
 delete 'signout', to: 'session#destroy'
end
