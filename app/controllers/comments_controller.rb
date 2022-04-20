# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_todo!
  before_action :set_comment!, except: :create
  
  def create
    @comment = @todo.comments.create(comment_params)
    if (@comment.save)
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to todo_path(@todo)
  end

  def edit
  end

  def update
    if @comment.update comment_params
      flash[:success] = "comment update"
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end

  def set_todo!
    @todo =Todo.find params[:todo_id]
  end

  def set_comment!
    @comment = @todo.comments.find params[:id]
  end
end
