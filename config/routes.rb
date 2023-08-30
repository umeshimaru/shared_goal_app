Rails.application.routes.draw do
  
  resources :monthly_goals do 
    member do 
      get 'mypage'
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





  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

