class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end

  def checkout
    movie = Movie.where(id: params[:movie_id]).first!
    current_user.add_checkout movie
    head :ok
  end

end