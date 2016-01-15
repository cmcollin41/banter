Rails.application.routes.draw do
  
  devise_for :users, :skip => [:registrations], :controllers => { invitations: 'invitations' }                                
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end

  resources :schools, shallow: true do 
    resources :conversations do
      resources :comments, module: :conversations do
        resource :favorite
      end
      resources :polls, module: :conversations
      resources :answers, module: :conversations
      resource :upvote, module: :conversations
    end
    resource :commitment, module: :schools
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :users do
    collection do
      post :import
    end
  end

  root to: "schools#index"
end
