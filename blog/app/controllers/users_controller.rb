class UsersController < ApplicationController
	before_filter :authenticate_user!
  def index
  end 

  def show
  end


  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render :new
    end
  end
end
