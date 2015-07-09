class List < ActiveRecord::Base
	has_many :goals, dependent: :destroy
	belongs_to :user

	validates :title, presence: true

	before_save :titleize_title

	private

		def titleize_title
			self.title = title.titleize
		end
end
