# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo!, only: %i[show destroy edit update]

  def index
    @todo = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show; end

  def edit; end

  def update
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy

    redirect_to todos_path
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body)
  end

  def set_todo!
    @todo = Todo.find params[:id]
  end
end
