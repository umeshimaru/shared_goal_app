Rails.application.routes.draw do
  resources :monthly_goals
  devise_for :users,  controllers: {
    registrations:  'users/registrations'
  }
  get 'users/home'
  get 'users/new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

