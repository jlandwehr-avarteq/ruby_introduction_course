Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, only: [:index, :create, :update, :edit, :destroy] do
    post :update_status, on: :member
  end
end
