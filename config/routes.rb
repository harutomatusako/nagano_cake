Rails.application.routes.draw do

  devise_for :customers,
  path: '',
  path_names: {
    sign_in: 'customers/sign_in',
    sign_up: 'customers/sign_up',
    sign_out: 'customers/sign_out',
    password: 'customers/passwords',
  },
  controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions",
    password: 'public/passwords'
  }

  namespace :admin do
    devise_for :admins, controllers: {
     sessions: 'admin/admins/sessions'
    }
  end


  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :create, :edit, :update, :new, :show]
    resources :customers, only: [:index, :edit, :update,:show]
    resources :orders, only: [:update,:show]

  end

  scope module: :customer do
    root to: "homes#top"
    get "homes"=>"homes#about"

    resource :customers, only: [:update] do
      collection do
        get 'quit'
        patch 'out'
      end
    end
    get "customers/my_page"=>"customers#show"
    get "customers/edit"=>"customers#edit"
   
    resources :shipping_address, only: [:index, :create, :edit, :update, :destroy]
   
  end


end
