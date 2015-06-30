class ListsController < ApplicationController
  def show
  end

  def index
  	@lists = List.all
  	@numrows = 1 + @lists.count / 3
  end
end
