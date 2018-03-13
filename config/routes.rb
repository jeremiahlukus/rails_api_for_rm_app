Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'sessions' => 'sessions#create', :as => 'login'
    delete 'sessions' => 'sessions#destroy', :as => 'logout'
    post 'registrations' => 'registrations#create', :as => 'register'
  end
  get 'feedbacks' => 'feedbacks#index', :as => 'feedbacks'

end
