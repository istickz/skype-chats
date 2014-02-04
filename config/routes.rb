SkypeChats::Application.routes.draw do


  get 'help', to: 'static_pages#help'
  get "profiles/show"
  root 'home#index'

  namespace :admin do
    root to: "dashboard#index"
      resources    :users,
                         :categories,
                         :chats,
                         :dashboard
  end

  devise_for :admins
  resources :chats
  resource :profile
  resources :categories do
    resources :chats
  end
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}, path_names: {sign_in: "login", sign_out: "logout"}

end
