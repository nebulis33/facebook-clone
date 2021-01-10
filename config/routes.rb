Rails.application.routes.draw do
  devise_for :users, path: 'member', path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :users, only: [:index, :show] do
    resource :friendship, only: [:create, :update, :destroy]
  end
end
