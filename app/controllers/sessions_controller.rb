class SessionsController < ApplicationController
  def new
    @errors = []
  end

  def create
    @errors = []
    @errors.append('Email is missing.') if params[:email].blank?
    @errors.append('Password is missing.') if params[:password].blank?

    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/reports'
    else
      @errors.append('Invalid email and/or password.')
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
