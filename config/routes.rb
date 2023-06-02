Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#login"

  get "signup", to: "users#new"
  post "users/create", to: "users#create"
  get "login", to: "users#login_form"
  post "login", to: "users#login"
  get "logout", to: "users#logout"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  resources :users, except: [:show] do
    get :likes, on: :member
  end
  get "users/search", to: "users#search"

  get "riyoukiyaku" => "home#riyoukiyaku"
  get "puraibasiporisi" => "home#puraibasiporisi"

  get "contacts" => "contact#new"
  post "contacts/create" => "contact#create"
  
  get "posts/search" => "posts#search"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/destroy" => "posts#destroy"

  get "likes/:post_id/create" => "likes#create", as: "create_like"
  get "likes/:post_id/destroy" => "likes#destroy", as: "destroy_like"
  get "likes/:music_id/music_create" => "likes#music_create", as: "music_create_like"
  get "likes/:music_id/music_destroy" => "likes#music_destroy", as: "music_destroy_like"
  get "likes/:image_id/image_create" => "likes#image_create", as: "image_create_like"
  get "likes/:image_id/image_destroy" => "likes#image_destroy", as: "image_destroy_like"
  get "likes/:movie_id/movie_create" => "likes#movie_create", as: "movie_create_like"
  get "likes/:movie_id/movie_destroy" => "likes#movie_destroy", as: "movie_destroy_like"

  get "images/search" => "images#search"
  post "images/:id/update" => "images#update", as: "update_image"
  get "images/:id/destroy" => "images#destroy", as: "destroy_image"
  resources :images do
    resources :image_events, only: [:index]
  end

  get "musics/search" => "musics#search"
  post "musics/:id/update" => "musics#update", as: "update_music"
  get "musics/:id/destroy" => "musics#destroy", as: "destroy_music"
  resources :musics do
    resources :music_events, only: [:index]
  end

  get "movies/search" => "movies#search"
  post "movies/:id/update" => "movies#update", as: "update_movie"
  get "movies/:id/destroy" => "movies#destroy", as: "destroy_movie"
  resources :movies do
    resources :movie_events, only: [:index]
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
end

