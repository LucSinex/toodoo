class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Registration successful."
  		redirect_to lists_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "Successfully updated user."
  		redirect_to lists_url
  	else
  		render 'edit'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:login, :email, :password, :password_confirmation)
  	end
end
