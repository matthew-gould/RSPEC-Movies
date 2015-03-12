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
  end

  # def authorize_check (movie)
  #   if self.rented < self.plan && self.age >= 18
  #     add_checkout movie
  #   elsif self.rented < self.plan && self.age >= 13 && movie.rating != "R"
  #     add checkout movie
  #   elsif self.rented < self.plan && self.age < 13 && movie.raiting != "R" || "PG13"
  #     add_checkout movie
  #   else
  #     render :index
  #   end
  # end

  # def authorize_stream (movie)
  #   if self.rented < self.plan && self.age >= 18
  #     add_checkout movie
  #   elsif self.rented < self.plan && self.age >= 13 && movie.rating != "R"
  #     add checkout movie
  #   elsif self.rented < self.plan && self.age < 13 && movie.raiting != "R" || "PG13"
  #     add_checkout movie
  #   else
  #     render :index
  #   end
  # end
end
