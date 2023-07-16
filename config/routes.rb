Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/search", to: "application#search"
  # Defines the root path route ("/")
  # root "articles#index"
 
  get "signup", to: "users#new"
  post "users/create", to: "users#create"
  post "users/:id/update" => "users#update"
  get "/", to: "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/destroy" => "users#destroy", as: "destroy_user"
  get "users/:id/requests" => "users#requests"

  resources :users, except: [:show] do
    get :likes, on: :member
  end

  get "riyoukiyaku" => "home#riyoukiyaku"
  get "puraibasiporisi" => "home#puraibasiporisi"

  get "contacts" => "contact#new"
  post "contacts/create" => "contact#create"
  
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

  post "musics/:id/update" => "musics#update", as: "update_music"
  get "musics/:id/destroy" => "musics#destroy", as: "destroy_music"
  resources :musics do
    resources :music_events, only: [:index]
  end

  post "images/:id/update" => "images#update", as: "update_image"
  get "images/:id/destroy" => "images#destroy", as: "destroy_image"
  resources :images do
    resources :image_events, only: [:index]
  end

  post "movies/:id/update" => "movies#update", as: "update_movie"
  get "movies/:id/destroy" => "movies#destroy", as: "destroy_movie"
  
  resources :movies do
    resources :movie_events, only: [:index]
  end

  resources :applies, only: [:index, :create, :destroy, :update]
  get "applies/:id/index" => "applies#index"

  post "images/:id/applies" => "applies#image_create"
  post "images/:id/applies/update" => "applies#image_update"
  delete "images/:id/applies" => "applies#image_destroy"

  post "movies/:id/applies" => "applies#movie_create"
  post "movies/:id/applies/update" => "applies#movie_update"
  delete "movies/:id/applies" => "applies#movie_destroy"

  post "musics/:id/applies" => "applies#music_create"
  post "musics/:id/applies/update" => "applies#music_update"
  delete "musics/:id/applies" => "applies#music_destroy"

  post "posts/:id/applies" => "applies#post_create"
  post "posts/:id/applies/update" => "applies#post_update"
  delete "posts/:id/applies" => "applies#post_destroy"

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :messages, only: [:create]
  get "rooms/index" => "rooms#index"
  get "rooms/:id" => "rooms#show"
  resources :rooms, only: [:create, :index, :show]
end

