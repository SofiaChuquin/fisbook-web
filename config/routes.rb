Rails.application.routes.draw do
  # resources :people
  resources :students
  resources :executives
  resources :teachers

  resources :cycles do
    resources :enrollments, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :courses, only: [:new, :create, :edit, :update, :show, :destroy]
  end


  resources :courses do
    resources :demands
    resources :students do
      resources :notes
    end
  end

  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do 
      namespace :sessions do
        post :create
        delete :destroy
      end
      resources :notes
    end 
  end 
end
