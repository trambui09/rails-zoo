Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "animals#index"
  resources :animals
  # get "/animals", to: "animals#index", as: 'animals'
  # get "/animals/new", to: "animals#new", as: "new_animal"
  # post "/animals", to: "animals#create"
  #
  # # get a specific animal
  # get "/animals/:id", to: "animals#show", as: "animal"
  # get "/animals/:id/edit", to: "animals#edit", as: "edit_animal"
  # patch "/animals/:id", to: "animals#update"
  # delete "/animals/:id", to: "animals#destroy"


end
