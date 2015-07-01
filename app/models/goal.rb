class Goal < ActiveRecord::Base
  belongs_to :list

  def complete
    self.done = true
    self.save
  end
end
