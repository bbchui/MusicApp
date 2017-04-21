class UsersController < ApplicationController
  def new
    render :new
  end

  def create #sign up form. Username: --- password: blah blah
    @user = User.new(user_params)
    fail
    if @user.valid?
      @user.save
      # login!(@user)
      # redirect_to user_url(@user)
    else
      render :new
    end
  end


  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password) # => user fills in.
  end
end
