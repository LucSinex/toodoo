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

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to lists_path
    else
      flash[:danger] = "List could not be updated"
      render 'edit'
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

  def destroy   
    @list = List.find(params[:id])
    @list.destroy 
    redirect_to lists_path
  end

  private

  	def list_params
  		params.require(:list).permit(:title)
  	end
end
