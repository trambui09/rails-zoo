Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "animals#index"
  get "/animals", to: "animals#index", as: 'animals'
  get "/animals/new", to: "animals#new", as: "new_animal"

  # get a specific animal
  get "/animals/:id", to: "animals#show", as: "animal"

end
