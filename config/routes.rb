Rails.application.routes.draw do
  get 'my_dashboard',to: "dashboards#index"
  get 'open_chats', to: "dashboards#get_open_chats", as: 'open_chats'
  get 'design', to: "designs#index", as: 'meet-the-team'
  # get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  resources :chats, only: [:show, :create, :destroy] do
    resources :messages, only: [:create]
  end
  get 'refresh_chat_banner/:id', to: 'chats#refresh_chat_banner', as: 'refresh_chat_banner'
  get 'emergency_contacts/:user_id', to: "emergency_contacts#index", as: "emergency_contacts"
  patch 'dashboard/:user_id', to: "dashboards#update", as: "dashboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
