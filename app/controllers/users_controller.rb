class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    super
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path(@user), flash[:notice] = 'You have successfully signed up!'
    else
      render :new
    end
  end

  protected
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :age, :email)
  end

end
