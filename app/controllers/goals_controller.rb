class GoalsController < ApplicationController
  def create
  	@list = List.find(params[:list_id])
  	@goal = @list.goals.create(goal_params)
  	redirect_to list_path(@list)
  end

  def destroy
  end

  private

  	def goal_params
  		params.require(:goal).permit(:content)
  	end
end
