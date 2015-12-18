Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end

  resources :schools

  resources :conversations do
    resources :comments, module: :conversations
    resources :polls, module: :conversations
    resources :answers, module: :conversations
    resource :like, module: :conversations
  end
  
  resources :users do
    collection do
      post :import
    end
  end

  root to: "conversations#index"
end
