class Goal < ActiveRecord::Base
  belongs_to :list
  before_save :cap_first

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

  	def cap_first
  		self.content[0] = content[0].capitalize
  	end
end
