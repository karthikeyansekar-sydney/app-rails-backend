class SessionController < ApplicationController
  def new
  end # new

  def create
    # 1 Check if email address entered is actually in the user's table
    user = User.find_by email: params[:email]

    # Did we find a user with that email? 
    if user.present? && user.authenticate( params[:password] )
      # credentials were correct and so it creates a session

      session[:user_id] = user.id
      
      redirect_to root_path

    else 
      #user was nil (email address not in database) or no password matching

      flash[:error] = 'Invalid email or password'
      redirect_to login_path

    end #login check
  end # create


  def destroy
    session[:user_id] = nil #this logs out the user.
    redirect_to login_path
  end
end