Rails.application.routes.draw do
root to: 'homes#top'
resources :books



post 'books' => 'books#create'
get 'books' => 'books#index'
get 'books/:id' => 'books#show'
get 'books/:id/edit' => 'books#edit'
patch 'books/:id' => 'books#update'

 end
