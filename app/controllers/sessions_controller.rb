class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # puts 'THIS IS PARAMS',params
      # puts 'THIS IS email',params[:email]
      # puts 'THIS IS password',params[:password]
      # puts params[:email] == "tom.zhang989@gmail.com"
      # puts 'does password == password' , params[:password] == "password"
      # puts "this is user", user
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'     
    elsif user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
