Rails.application.routes.draw do
	root "sessions#new"

	get "/", to: "sessions#new"
	post "/sign-in", to: "sessions#create"
	delete "/sign-out", to: "sessions#destroy"

	resources :users
	resources :posts
end
