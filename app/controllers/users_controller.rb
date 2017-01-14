class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @person = Person.find_or_create_by(email: user_params['email'])
    @user.person_id = @person.id

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/reports'
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
