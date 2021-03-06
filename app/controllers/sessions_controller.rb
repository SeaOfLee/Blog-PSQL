class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # finds the user by email. Returns entire object. 
    u = User.where(email: params[:user][:email]).first
    if u != nil && u.authenticate(params[:user][:password])
      # if user is authenticated, creates cookie in browser. Session is a rails specific idea.
      # Cookie only sticks if redirect_to renders a complete page. 
      session["user_id"] = u.id.to_s
        if u.is_admin?
          redirect_to user_path(u.id)
        else
          redirect_to posts_path
        end
    end
  end

  def destroy
    session.destroy
    redirect_to posts_path
  end
end
