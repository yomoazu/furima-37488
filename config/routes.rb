Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  #post 'posts', to: 'posts#create'
end
