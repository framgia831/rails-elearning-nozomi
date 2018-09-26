Rails.application.routes.draw do
	root "users#new"
	get "/signup", to: "users#new"
	post "/signup", to: "users#create"

	get "/login", to: "sessions#new"
	get "/progress", to: "sessions#index"
	get "/dashboard", to: "sessions#show"
	post "/login", to: "sessions#create"
	delete "/login", to: "sessions#destroy"

	post "/users/:id/edit", to: "users#edit"
	get "/index", to: "users#index"

	post "/index_relationships", to: "relationships#index_create"
	delete "/index_relationships", to: "relationships#index_destroy"
 
	resources :users, except: :new do
	  member do
	    get :following, :followers
	  end
	end

	namespace 'admin' do
	  	resources :categories, :users do
	  		resources :words do
	  			resources :choices
			end
		end
	end

	resources :relationships, only: [:create, :destroy, :index]

	resources :categories, only: [:index] do
		resources :lessons do
			resources :answers do
			end
		end
	end

end

