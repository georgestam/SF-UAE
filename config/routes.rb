Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  scope '(:locale)', locale: /en|ea/ do
  
    root to: 'pages#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get "/coming_soon", to: "pages#coming_soon", as: :coming_soon
    
    resources :pages, only: %i[index] 
  
    resources :articles, only: %i[index show]
    
    resources :stories, only: %i[index show]
  
  end

end
