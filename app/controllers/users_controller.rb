class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes(user_params)
    flash[:success] = "Updated Successfully"
    redirect_to root_path
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :street_address, :first_name, :last_name, :zip_code, :country, :state)
  end
end
