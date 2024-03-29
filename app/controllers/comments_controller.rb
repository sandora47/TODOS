# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_todo!
  before_action :set_comment!, except: :create

  def create
    @comment = @todo.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to todo_path(@todo)
    else
      @comments = Comment.order created_at: :desc
      render 'todos/show'
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment delete!'
    redirect_to todo_path(@todo)
  end

  def edit; end

  def update
    if @comment.update comment_params
      flash[:success] = 'Comment update'
      redirect_to todo_path(@todo, anchor: "comment-#{@comment.id}")
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def set_todo!
    @todo = Todo.find(params[:todo_id])
  end

  def set_comment!
    @comment = @todo.comments.find(params[:id])
  end
end
