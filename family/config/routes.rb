Rails.application.routes.draw do
  resources :degrees
  resources :schools
  root 'people#index'

  resources :people do
    resources :pets, except: [:index, :show, :new]
  end
end