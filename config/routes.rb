Rails.application.routes.draw do
	resources :posts #для каждого действия в контроллеере свой урл
  root to: 'posts#index'
end
