class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    # id = params[:id]
    # todo = Todo.find_by(id: id)
    # render plain: !todo.nil? ? todo.to_pleasant_string : "OOPs!, No such Id found!!!"
    render "test1"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      :todo_text => todo_text,
      :due_date => due_date,
      :completed => false,
    )
    response_text = "Hey, your new todo is created with id #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find_by(id: id)
    if (!todo.nil?)
      todo.completed = completed
      todo.save!
      render plain: "Updated todo completed status to #{completed} for the id #{todo.id}"
    else
      render plain: "OOps! No such Id found to Update"
    end
  end
end
