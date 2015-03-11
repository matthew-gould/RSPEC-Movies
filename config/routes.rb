Rails.application.routes.draw do
  devise_for :users

  root to: 'movies#index'

  get '/movies/checkouts' => 'movies#checkouts'
  post '/movies/checkout/:movie_id' => 'movies#checkout'


  get '/movies/streams' => 'movies#streams'
  post '/movies/stream/:movie_id' => 'movies#stream'
  
end
