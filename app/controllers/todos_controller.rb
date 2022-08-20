class TodosController < ApplicationController
  before_action :set_todo!, only: [:show, :destroy, :edit, :update]

  def index
    @todos = Todo.order(created_at: :desc).page params[:page]
  end

  def new
    if user_signed_in?
      @todo = Todo.new
    else
      flash[:danger] = "You must be logged in."
      redirect_to new_session_path
    end
  end

  def show
    @comment = @todo.comments.build
    @comments = Comment.order created_at: :desc
  end

  def edit; end

  def update
    if @todo.update(todo_params)
      flash[:success] = 'Todo update!'
      redirect_to home_path(@todo, anchor: "todo-#{@todo.id}")
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy
    flash[:success] = 'Todo delete!'

    redirect_to home_path(@todo)
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:success] = 'Todo created!'
      redirect_to home_path(@todo)
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
