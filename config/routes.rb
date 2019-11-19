Rails.application.routes.draw do
	resources :visitors
	resources :posts
	resources :upvotes, only: [:create, :destroy]
end
