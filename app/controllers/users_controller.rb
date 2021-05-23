class UsersController < ApplicationController
  def index
    render plain: User.all.map { |user| user.show_user_details }.join("\n")
  end
end
