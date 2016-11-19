Rails.application.routes.draw do
  devise_for :users
	resources :posts #для каждого действия в контроллеере свой урл
  root to: 'posts#index'
end
