Rails.application.routes.draw do
  get 'bases/new'

  get 'base/new'

  get 'bnse/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  get 'users/index1' , to: 'users#index1'
  get 'users/edit1' , to: 'users#edit1'
  get 'users/log' , to: 'users#log'
  get 'users/index_attendace' , to: 'users#index_attendace'
  get 'users/edit_base' , to: 'users#edit_base'
  
  # ログイン機能 #
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    collection { post :import }
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      get 'edit1_basic_info'
      patch 'update_basic1_info'
      get 'edit2_basic_info'
      patch 'update_basic2_info'
      get 'edit3_basic_info'
      patch 'update_basic3_info'
      get 'edit4_basic_info'
      patch 'update_basic4_info'
    end
    resources :attendances, only: :update
  end
  
  resources :bases do
    member do
     get 'edit_basic_info'
    patch 'update_basic_info'
    end 
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
