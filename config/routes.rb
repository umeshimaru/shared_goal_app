Rails.application.routes.draw do
  
  get 'relationships/:id/new', to:'relationships#new'
  get 'relationships/create'
  get 'relationships/destroy'
  resources :weekly_goals
  resources :tasks
  resources :monthly_goals do 
    member do 
      get 'my_goal'
    end
  end
  resources :users do
    collection do
      get 'search' => 'users#search'
    end
  end


   
  devise_for :users,  controllers: {
    registrations:  'users/registrations',
    confirmations:  'users/confirmations',
  }
  devise_scope :user do
    get '/confirmation_email', to: 'users/confirmations#check_email'
    get '/monthly_goals/new',  to: 'users/monthly_goals#new'
  end

   post '/monthly_goals/:id/my_goal', to: 'weekly_goals#create'

 


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

