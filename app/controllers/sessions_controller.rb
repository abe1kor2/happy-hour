class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == Rails.application.credentials.admin_username && password == Rails.application.credentials.admin_password
      session[:admin_id] = true
      redirect_to root_path, notice: "Logged in successfully as admin."
    else
      flash.now[:alert] = "Invalid username or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end
