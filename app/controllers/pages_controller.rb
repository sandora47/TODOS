# frozen_string_literal: true

class PagesController < ApplicationController
  include Pagy::Backend
  def todopage
    @pagy, @todos = pagy Todo.order(created_at: :desc)
  end
end
