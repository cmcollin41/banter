Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end

  resources :schools, shallow: true do 
    resources :conversations do
      resources :comments, module: :conversations
      resources :polls, module: :conversations
      resources :answers, module: :conversations
      resource :like, module: :conversations
    end
  end


  resources :users do
    collection do
      post :import
    end
  end

  root to: "schools#index"
end
