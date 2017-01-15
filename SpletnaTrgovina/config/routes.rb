Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: "home#index"

  get 'home/index'


  get '/search', to: 'home#search'


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
    get '/card', to: 'records#card'

    post '/carditem/new', to: 'home#add_to_card'

    get '/records/all', to: 'records#all'

    delete '/carditem', to: 'records#remove_carditem'

    resources :records



  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
