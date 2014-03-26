NinetyNineCats::Application.routes.draw do
  get "/" => 'cats#index'

  resources :cats do
    resources :cat_rental_requests, :only => [:create, :new, :index] do
      post "approve" => 'cat_rental_requests#approve!'
      post "deny" => 'cat_rental_requests#deny!'
    end
  end

  resources :users, :only => [:create, :new, :show]

  resource :sessions
end
