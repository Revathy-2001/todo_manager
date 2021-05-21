class TodosController < ApplicationController
  def index
    render plain: "Hello, this is Rails! #{DateTime.now.to_s(:short)}"
  end
end
