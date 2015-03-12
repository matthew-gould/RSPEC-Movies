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
    movie.update! out: true
  end

  def add_stream (movie)
    movie.update! streaming: true
  end

  def age_check
  end


  def authorize_check (movie)
    if self.rented < self.plan && self.age >= 18
      add_checkout movie
    elsif self.rented < self.plan && self.age >= 13 && self.age < 18 && movie.rating != "R"
      add checkout movie
    elsif self.rented < self.plan && self.age < 13 && movie.rating != "PG13" && movie.rating != "R"
      add_checkout movie
    else
      false
    end
  end

  def authorize_stream (movie)
    if self.age >= 18
      add_stream movie
    elsif self.age >= 13 && self.age < 18 && movie.rating != "R"
      add_stream movie
    elsif self.age < 13 && movie.rating != "PG13" && movie.rating != "R"
      add_stream movie
    else
      false
    end
  end
end
