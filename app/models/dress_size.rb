class DressSize < ActiveRecord::Base
	# Association
  belongs_to :dress
  has_many :reservations, dependent: :destroy

  # Validations
  validates :size, presence: true
end
