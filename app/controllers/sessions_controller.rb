class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # login the user
        flash["notice"] = "Login Successful"
        redirect_to "/posts"
      else
        flash["notice"] = "Unsuccessful Login"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful Login"
      redirect_to "/sessions/new"
    end
  end
end
