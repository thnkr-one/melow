class SessionsController < ApplicationController
  before_action :set_session, only: :destroy
  skip_authentication only: %i[new create]
  layout "auth"

  def new; end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      @session = create_session_for(user)
      redirect_to root_path
    else
      flash.now[:alert] = t(".invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t(".logout_successful")
  end

private
  def set_session
    @session = Current.user.sessions.find(params[:id])
  end
end
