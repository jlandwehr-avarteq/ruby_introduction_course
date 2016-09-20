Rails.application.routes.draw do
  root 'people#index'

  resources :people do
    resources :pets, except: [:index, :show, :new]
  end
end
