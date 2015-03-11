require 'rails_helper'

describe MoviesController do
  render_views

  it "can list all movies" do
    5.times do
      FactoryGirl.create :movie
    end

    get :index

    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 5
    expect(json.last["name"]).to eq "Movie5"
  end

  it "users can checkout movies" do
    user = FactoryGirl.create :user
    login user
    movie = FactoryGirl.create :movie

    post :checkout, movie_id: movie.id
    user.reload
    movie.reload
    expect(response.code.to_i).to eq 200
    binding.pry
    expect(user.rented).to eq 1
    expect(movie.out).to eq true
  end



  it "users can stream movies"
  it "can verify a user must be logged in to checkout or stream a movie"
  it "can verify someone is old enough to stream/checkout movies"
  it "can stream when user has streaming plan"
  it "can stream when users is under movie checkout maximum"
  it "can handle when a movie doesnt exist"

end