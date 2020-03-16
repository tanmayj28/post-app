Rails.application.routes.draw do
	resources :visitors
	resources :posts
	resources :upvotes, only: [:create, :destroy]
	get "visitors/list_posts/:id", to: "visitors#list_posts"
end
