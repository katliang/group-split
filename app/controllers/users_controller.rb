class UsersController < ApplicationController

  def create
    @errors = []
    @errors.append('Email is missing.') if user_params[:email].blank?
    @errors.append('Password is missing.') if user_params[:password].blank?
    @errors.append('Please confirm your password.') if user_params[:password].blank?
    @errors.append('Entered passwords do not match. Please try again.') if user_params[:password] != params[:password_confirmation]

    @user = User.new(user_params)
    @person = Person.find_or_create_by(email: user_params['email'])
    @user.person_id = @person.id

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/reports'
    else
      @errors.append('This email cannot be registered.')
      render 'welcome/index'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
