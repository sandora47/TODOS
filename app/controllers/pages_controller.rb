# frozen_string_literal: true

class PagesController < ApplicationController
  def todopage
    @todos = Todo.order(created_at: :desc).page params[:page]
  end
end
