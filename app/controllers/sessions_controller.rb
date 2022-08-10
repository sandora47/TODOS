# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentification, only: [:new, :create]
  before_action :require_authentification, only: :destroy

  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      redirect_to todos_path
    else
      flash[:danger] = 'Wrong password or username'
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to todos_path
  end
end
