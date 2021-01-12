Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, path: 'member', path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :users, only: [:index, :show] do
    resource :friendship, only: [:create, :update, :destroy]
  end
  resources :posts do
    post 'like', on: :member
    delete 'unllike', on: :member
  end
  resources :comments do
    post 'like', on: :member
    delete 'unllike', on: :member
  end
end
