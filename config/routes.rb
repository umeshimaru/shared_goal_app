Rails.application.routes.draw do

  get '/users/friend_goal',          to: 'users#friend_goal'
  patch 'relationships/accept_friend_request'
  get   'relationships/:id/new',              to:'relationships#new'
  get   'relationships/requests_status',      to:'relationships#requests_status',as: :requests_status
  post  'relationships/:id/create',           to:'relationships#create',as: :create_relationships
  get   'relationships/destroy'

  resources :weekly_goals
  resources :tasks
  resources :monthly_goals do 
    member do 
      get 'my_goal'
    end
  end



  #  deviseが用意しているデフォルトのコントローラーを使わず自分の環境のusersディレクトリは配下のコントローラーを使えというメソッド
  devise_for :users,  controllers: {
    registrations:  'users/registrations',
    confirmations:  'users/confirmations',
    sessions:       'users/sessions',
     }
  
     #↓は↑のusersディレクトリは配下のコントローラーにつなげるようにルーティングを作成するメソッド
     devise_scope :user do
      get '/confirmation_email', to: 'users/confirmations#check_email'
      get '/monthly_goals/new',  to: 'users/monthly_goals#new'
      delete '/logout',          to: 'users/sessions#destroy'
      get '/sign_up',            to: 'users/sessions#new'  
      get '/sign_up_account',    to: 'users/registrations#new'  
      post 'register',           to: 'users/registrations#create'  
  
    end
  
  resources :users do
    collection do
      get 'search' => 'users#search'
    end
  end

   post '/monthly_goals/:id/my_goal', to: 'weekly_goals#create'
   get '/notifications/index',        to: 'notifications#index'


 


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

