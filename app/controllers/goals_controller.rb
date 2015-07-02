class GoalsController < ApplicationController
  def create
  	@list = List.find(params[:list_id])
  	@goal = @list.goals.create(goal_params)
  	redirect_to list_path(@list)
  end

  def destroy
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes goal_params
      redirect_to list_path(params[:list_id])
    else
      render 404
    end
  end

  def complete
    @list = List.find(params[:list_id])
    Goal.where(id: params[:goal_ids]).update_all(:done => :true)
    redirect_to list_path(@list)
  end

  private

  	def goal_params
  		params.require(:goal).permit(:content, :done)
  	end
end
