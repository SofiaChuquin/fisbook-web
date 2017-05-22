Rails.application.routes.draw do
  resources :enrollments
  resources :demands
  resources :executives
  #devise_for :users
  resources :notes
  resources :cycles
  resources :teachers
  resources :students
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
