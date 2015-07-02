class List < ActiveRecord::Base
	has_many :goals, dependent: :destroy

	validates :title, presence: true
end
