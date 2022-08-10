class TodosController < ApplicationController
  before_action :set_todo!, only: [:show, :destroy, :edit, :update]

  def index
    @todos = Todo.order(created_at: :desc).page params[:page]
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
    params.require(:todo).permit(:title, :body).merge(user_id: current_user.id)
  end

  def set_todo!
    @todo = Todo.find params[:id]
  end
end
