class UserSessionsController < ApplicationController

	def new
		@user_session = UserSession.new
	end

	def create
		@user_session = UserSession.new(params[:user_session])
		if @user_session.save
			flash[:notice] = "Successfully logged in."
			redirect_to root_path
		else
			flash[:danger] = "Login was not successful."
			render 'new'
		end
	end

	def destroy
		@session = UserSession.find(params[:id])
		@session.destroy
		redirect_to root_path
	end

end
