Rails.application.routes.draw do
  get 'emergency_contacts', to: "emergency_contacts#index"
  get 'my_dashboard',to: "dashboards#index"
  get 'open_chats', to: "dashboards#get_open_chats", as: 'open_chats'
  get 'design', to: "designs#index"
  # get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  resources :chats, only: [:show, :create] do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
