require 'rails_helper'

describe MoviesController do
  render_views

  it "can list all movies" do
    5.times do
      FactoryGirl.create :movie
    end
      user = FactoryGirl.create :user, age: 20, plan: 3
      login user

    get :index

    expect(response.code.to_i).to eq 200

    json = response_json
    expect(json.class).to eq Array
    expect(json.count).to eq 5
    expect(json.last["name"]).to eq "Movie5"
  end

  it "users can checkout movies" do
    user = FactoryGirl.create :user, age: 20, plan: 3
    login user
    movie = FactoryGirl.create :movie

    post :checkout, movie_id: movie.id
    user.reload
    movie.reload
    expect(response.code.to_i).to eq 200
    expect(user.rented).to eq 1
    expect(movie.out).to eq true
  end

  it "users with correct plan can stream movies" do
    user = FactoryGirl.create :user, plan: 3
    login user
    movie = FactoryGirl.create :movie

    post :stream, movie_id: movie.id
    movie.reload
    expect(response.code.to_i).to eq 200
    expect(user.plan).to eq 3
    expect(movie.streaming).to eq true
  end

  it "requires login before user can checkout or stream a movie" do
    movie = FactoryGirl.create :movie

    post :checkout, movie_id: movie.id
    expect(flash["alert"]).to include "sign in or sign up"
    expect(response.code.to_i).to eq 302
  end

  it "can verify someone is old enough to stream/checkout movies"
  it "can stream when users is under movie checkout maximum"
  it "can handle when a movie doesnt exist"

end