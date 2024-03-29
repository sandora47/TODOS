# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentification, only: [:new, :create]
  before_action :require_authentification, only: :destroy

  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      remember(user) if params[:remember_me] == '1'
      redirect_to todos_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to todos_path
  end
end
