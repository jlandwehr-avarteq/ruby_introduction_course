Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks, only: [:create, :show, :update, :edit, :destroy] do
    post :update_status, on: :member
  end
end
