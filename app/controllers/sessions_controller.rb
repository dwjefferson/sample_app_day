class SessionsController < ApplicationController

  def new
  end

  def create
    userx = User.find_by_email(params[:session][:email].downcase)
    if userx && userx.authenticate(params[:session][:password])
        sign_in user  # or userx
      redirect_to user  # or userx
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
