class Movie < ActiveRecord::Base
has_many :users, through: :checkouts
has_many :checkouts

end