Rails.application.routes.draw do
  devise_for :customers

  namespace :admin do
    devise_for :admins, controllers: {
     sessions: 'admin/admins/sessions'
    }
  end
  
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end 


end
