Rails.application.routes.draw do

  root 'articles#index'
 
  resources :articles, except: :index do
    resources :comments
  end
end