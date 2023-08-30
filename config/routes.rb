Rails.application.routes.draw do
  
  resources :monthly_goals
  devise_for :users,  controllers: {
    registrations:  'users/registrations',
    confirmations:  'users/confirmations',
   

  }
  devise_scope :user do
    get '/confirmation_email', to: 'users/confirmations#check_email'
    get '/monthly_goals/new',  to: 'users/monthly_goals#new'
    
  end

  get 'users/home'
  get 'users/new'
  get '/my_page/:id',       to: 'users#my_page', as: 'my_page'


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

