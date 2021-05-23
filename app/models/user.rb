class User < ActiveRecord::Base
  def show_user_details
    "#{id}. #{name}"
  end
end
