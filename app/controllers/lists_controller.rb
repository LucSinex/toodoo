class ListsController < ApplicationController
  def index
  	@lists = List.all
  	@numrows = 1 + @lists.count / 3
  end

  def show
  	@list = List.find(params[:id])
    @goal = @list.goals.new
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

  private

  	def list_params
  		params.require(:list).permit(:title)
  	end
end
