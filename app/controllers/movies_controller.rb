class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
  end

  def checkout
    movie = Movie.where(id: params[:movie_id]).first!
    if current_user.plan > current_user.rented
      current_user.add_checkout movie
      Checkout.create!(user_id: current_user.id, movie_id: movie.id)
      head :ok
    else
      render :index
    end
  end

  def stream
    movie = Movie.where(id: params[:movie_id]).first!
    if current_user.plan >= 2
      movie.streaming = true
      movie.save!
      head :ok
    else
      render :index
    end
  end
end