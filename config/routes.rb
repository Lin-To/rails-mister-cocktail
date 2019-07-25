Rails.application.routes.draw do
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/delete'
  # get 'cocktails/index'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # get 'cocktails/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails do
    resources :doses
  end

  resources :doses, only: [:destroy]
  # delete "doses/:id", to: "doses#delete"

  root to: "cocktails#index"
end
