Rails.application.routes.draw do
  root 'chatrooms#index'
  get 'signup', to: 'sessions#signup'
  post 'register', to: 'sessions#register'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end
