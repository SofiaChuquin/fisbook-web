Rails.application.routes.draw do
  devise_for :users
  resources :detail_courses
  resources :courses
  resources :cycles
  resources :teachers
  resources :students
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
