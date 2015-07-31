Rails.application.routes.draw do

  resources :search_problems do
	  resources :comments
	  end

  resources :comments do
    resources :comments
	  end

  resources :simtags  do
	resources :comments
	  end

  resources :simvols  do
	resources :comments
	  end

  resources :solutions  do
	resources :comments
	  end

  resources :problems do
	resources :comments
	resources :profiles

	  end

  resources :partnerships do
	resources :comments
	  end

  resources :projects do
	resources :comments
	resources :profiles
	  end

  resource :user do
	resources :profiles
	end

#  resources :users do
#	  resources :profiles
#	  end

  devise_for :users

	  get 'welcome/index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
Teamup::Application.routes.draw do

  resources :search_problems

  resources :comments do
	resources :comments
	  	member do
		put "like", to: "comments#upvote"
		put "dislike", to: "comments#downvote"
		end
	  end

  resources :simtags  do
	resources :comments
	  end

  resources :solutions  do
	resources :comments

	  end


  resources :partnerships do
	resources :comments
	  	member do
		put "like", to: "partnerships#upvote"
		put "dislike", to: "partnerships#downvote"
		end

	  end

  resources :problems do
	resources :comments
	resources :profiles
	member do
		put "like", to: "problems#upvote"
		put "dislike", to: "problems#downvote"
		end

	  end

  resources :profiles do
	resources :comments
	member do
		put "like", to: "profiles#upvote"
		put "dislike", to: "profiles#downvote"
		end
	  end

	resource :user do
	resources :profiles
		  	member do
		put "like", to: "users#upvote"
		put "dislike", to: "users#downvote"
  resources :problems
		end
	end

  resources :users do
	resources :comments
	resources :profiles
  end

  root 'welcome#index'

end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
