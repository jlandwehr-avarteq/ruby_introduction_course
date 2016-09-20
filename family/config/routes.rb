Rails.application.routes.draw do
  root 'people#index'

<<<<<<< HEAD
  resources :people do 
    resources :pets
  end
=======
  resources :people
>>>>>>> master
end