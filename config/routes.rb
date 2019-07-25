Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :cocktails, only: [:new, :create, :index, :show]

  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, shallow: true
  end
  # delete "doses/:id", to: "doses#delete"

  root to: "cocktails#index"
end
