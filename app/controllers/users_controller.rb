class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    # render plain: User.order(:id).map { |user| user.show_user_details }.join("\n")
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    user = User.find_by(email: params[:email])
    exist = (!user.nil? && user.password == params[:password]) ? true : false
    render plain: exist
  end
end
