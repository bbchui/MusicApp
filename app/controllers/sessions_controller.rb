class SessionsController < ApplicationController
  def new
    render :new
  end

  def create # => login page. user will enter email/pass
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    login!(user)
    redirect_to user_url(user)
  end

  def destroy
  end
end
