# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.create(comment_params)

    redirect_to todo_path(@todo)
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.find(params[:id])
    @coment.destroy
    
    redirect_to todo_path(@todo)
  end 

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
