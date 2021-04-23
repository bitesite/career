Career::Engine.routes.draw do
  resources :tasks, only: [:index, :show]
end
