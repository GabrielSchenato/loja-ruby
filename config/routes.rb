Rails.application.routes.draw do
  root to: "produtos#index"
  get "produtos/new", to: "produtos#new"
  post "produtos", to: "produtos#create"
  delete "produtos/:id/remover", to: "produtos#destroy", as: :produto
end
