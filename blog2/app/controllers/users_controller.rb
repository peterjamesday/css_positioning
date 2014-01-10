class UsersController < ApplicationController
	before_filter :authenticate_user!



  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @post
    else
      render :new
    end
  end

	private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

    # Before filters

    

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
end

