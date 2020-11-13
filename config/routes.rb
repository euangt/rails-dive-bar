Rails.application.routes.draw do
  root to: "cocktails#index"
  get 'doses/new'
  post 'doses/', to: 'doses#create', as: 'doses'
  resources :cocktails, only: [ :index, :new, :create, :show ] do
    resources :doses, only: [ :new, :create ]
  end
  delete 'doses/:id', to: 'doses#destroy'
end
