class ListsController < ApplicationController
  def index
  	@lists = List.all
  	@numrows = 1 + @lists.count / 3
  end

  def show
    @list = List.find(params[:id])
  end

  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def complete_goal
    @list = List.find(params[:id])

    @goal = @list.goals.find(params[:goal_id])

    if @goal.complete
      redirect_to list_path(@list)
    else
      render 404
    end
  end

  private

  	def list_params
  		params.require(:list).permit(:title)
  	end
end
