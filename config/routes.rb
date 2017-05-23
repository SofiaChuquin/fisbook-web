Rails.application.routes.draw do
  resources :executives
  #devise_for :users

  resources :cycles do
    resources :enrollments
    resources :students
  end

  resources :teachers
  resources :students
  resources :people

  resources :courses do
    resources :demands
    resources :students do
      resources :notes
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
