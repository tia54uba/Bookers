Rails.application.routes.draw do
  resources :books
  #post 'books/index' => 'books#create'
  #get 'books/index' => 'books#index'
  #get 'books/:id' => 'lists#show',as:'book'
  #get 'books/edit'
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
