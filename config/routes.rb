Rails.application.routes.draw do
  get '/about', to: 'static_pages#about'
  devise_for :users
  resources :posts #для каждого действия в контроллеере свой урл
  root to: 'posts#index'
end
