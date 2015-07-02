class Goal < ActiveRecord::Base
  belongs_to :list

  validates :content, presence: true

  after_initialize :init

  def complete
    self.done = true
    self.save
  end

  private

  	def init
  		self.done ||= false
  	end
end
