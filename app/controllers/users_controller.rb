class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @person = Person.find_by(email: user_params['email'])

    if @person
        @user.person_id = @person.id
    else
        @new_person = Person.create(email: user_params['email'])
        @user.person_id = @new_person.id
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/reports'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
