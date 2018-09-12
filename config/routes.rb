Rails.application.routes.draw do
	root "users#new"
	get "/signup", to: "users#new"
	post "/signup", to: "users#create"

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/login", to: "sessions#destroy"

	post "/users/:id/edit", to: "users#edit"
	get "/index", to: "users#index"
 
	resources :users, except: :new do
	  member do
	    get :following, :followers
	  end
	end

	namespace 'admin' do
	  	resources :categories do
	  		resources :words do
	  			resources :choices
			end
		end
	end

	resources :relationships, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]
	resources :categories, only: [:index]

end

