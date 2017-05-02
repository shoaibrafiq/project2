Rails.application.routes.draw do

  resources :locations do
    collection do
      get 'search'
    end
  end
  
  devise_for :users
resources :films do
resources :reviews #nested routes
end
root 'films#index'
#instead of declaring seprate routes for the index, show, new, edit update and destroy actions, a resourceful route declares them in a single line of code

resources :genres

end
