class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies, through: :checkouts
  has_many :checkouts

  def add_checkout (movie)
    self.rented += 1
    self.save!
    movie.out = true
    movie.save!
    Checkout.create!(user_id: self.id, movie_id: movie.id)
    binding.pry
  end
end
