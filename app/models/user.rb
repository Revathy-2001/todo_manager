class User < ActiveRecord::Base
  has_many :todos

  def show_user_details
    "#{id}. #{name}"
  end
end
