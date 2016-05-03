class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
  	user = Customer.find_by_username(params[:name])
    if user and user.authenticate(params[:password])
      # writes user_id in session information
      session[:user_id] = user.id

      # Initialize new arrays for product and quantity. 
      session[:cart_prod] = Array.new
      session[:cart_qty] = Array.new


      if params[:name] == "admin"
           session[:admin] = "yes"
      else 
           session[:admin] = "no"
      end

      # redirects browser to root url
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
  	# resets session id to nil
    session[:user_id] = nil
    session[:admin] = "no"

    # Initialize new arrays for product and quantity. 
    session[:cart_prod] = Array.new
    session[:cart_qty] = Array.new

    redirect_to login_url, :notice => "Logged out!"
  end
end
