# frozen_string_literal: true

class PagesController < ApplicationController
  def todopage
    @todo = Todo.all
  end
end
