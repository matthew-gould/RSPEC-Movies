Rails.application.routes.draw do
  devise_for :users

  root to: 'movies#index'

  post '/movies/checkout/:movie_id' => 'movies#checkout'

  post '/movies/stream/:movie_id' => 'movies#stream'

  post '/movies/checkin/:movie_id' => 'movies#checkin'
  
end
