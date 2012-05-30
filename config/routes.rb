require 'resque/server'

Linky::Application.routes.draw do
  resources :users

  mount Resque::Server.new, :at => "resque"

  resources :links
  root :to => "links#index"
end
