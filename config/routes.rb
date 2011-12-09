WorkshopsRor::Application.routes.draw do
  resources :decisions do
    resources :choices, except: [:index, :show]
  end

  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :votes, only: [:create]

  root :to => "decisions#index"
end
