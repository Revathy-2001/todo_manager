class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.show_user_details }.join("\n")
  end

  def create
    new_user = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    render plain: "New User created with Id #{new_user.id}"
  end

  def login
    user = User.find_by(email: params[:email])
    exist = (!user.nil? && user.password == params[:password]) ? true : false
    render plain: exist
  end
end
