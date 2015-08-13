Rails.application.routes.draw do


root 'welcome#index'
get 'welcome/index'


  devise_for :users #, :paths => 'users'


  resources :users do
   resources :projects
   resources :problems
   resources :comments
   resources :profiles
   member do
     put "like", to: "users#upvote"
     put "dislike", to: "users#downvote"
     end
 end


  resource :user do
   resources :projects
   resources :problems
   resources :comments
   resources :profiles
   member do
     put "like", to: "users#upvote"
     put "dislike", to: "users#downvote"
     end
 end

  resources :search_problems do
	  resources :comments
	  end

  resources :comments do
  resources :profiles
  resources :comments
      member do
    put "like", to: "comments#upvote"
    put "dislike", to: "comments#downvote"
    end
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

  resources :projects do
	resources :comments
	resources :profiles
	  end


  resources :partnerships do
  resources :profiles
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
  resources :profiles
  resources :comments
  member do
    put "like", to: "profiles#upvote"
    put "dislike", to: "profiles#downvote"
    end
  end

resources :supporters do
  resources :profiles
  resources :comments
      member do
    put "like", to: "supporters#upvote"
    put "dislike", to: "supporters#downvote"
    end

    end


end
