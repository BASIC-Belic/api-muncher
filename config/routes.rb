Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipe#new'
  # post 'recipe#new', to: 'recipe#create', as: 'create_recipe'

  # get ':channel/new', to: 'chat#new', as: 'chat_new'
  # post ':channel', to: 'chat#create', as: 'chat_create'
end