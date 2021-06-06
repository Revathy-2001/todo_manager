class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

  def login
    user = User.find_by(email: params[:email])
    exist = (!user.nil? && user.password == params[:password]) ? true : false
    render plain: exist
  end

  def login
    user = User.find_by(email: params[:email])
    exist = (!user.nil? && user.password == params[:password]) ? true : false
    render plain: exist
  end
end
