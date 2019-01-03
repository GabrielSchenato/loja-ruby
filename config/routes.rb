Rails.application.routes.draw do
  root to: "produtos#index"
  get "produtos/new", to: "produtos#new"
end
