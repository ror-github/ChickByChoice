class Dress < ActiveRecord::Base
	# Associations
	has_many :dress_sizes, dependent: :destroy

	# validations
	validates :name, presence: true
end
