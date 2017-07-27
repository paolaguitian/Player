class SessionsController < ApplicationController
  # def create
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct.
  #   if user && user.authenticate(params[:password])
  #     # Save the user id inside the browser cookie. This is how we keep the user
  #     # logged in when they navigate around our website.
  #     session[:user_id] = user.id
  #     redirect_to games_path
  #   else
  #     # If user's login doesn't work, send them back to the login form.
  #     redirect_to login_path
  #   end
  # end
  #
  # def destroy
  #   session[:user_id] = nil
  #   redirect_to login_path
  # end

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      login_user!(@user)
    else
      flash.now[:error] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end

  private

  def login_user!(user)
    session[:user_id] = @user.id
    flash[:notice] = "Welcome, you're now logged in"
    redirect_to root_path
  end
end
