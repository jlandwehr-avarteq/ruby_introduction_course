Rails.application.routes.draw do
  root 'tasks#index'

  # %i() is the same as declaring an array of symbols [:sym1, :sym2]
  #
  # We want to have all the routes for tasks, except for index and new
  # Because Index is actually the Root of the application
  # We have the "new" form rendered on the root page
  resources :tasks, except: %i(index new) do
    post :update_status, on: :member
  end
end
