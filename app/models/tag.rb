class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :tagged_games, through: :taggings, source: :game

	validates :name, presence: true
end
