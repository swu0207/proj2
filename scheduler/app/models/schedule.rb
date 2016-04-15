class Schedule < ActiveRecord::Base
	belongs_to :student
	has_many :pokemons
end
