class UsersController < ApplicationController
  respond_to :json

  # skip_before_filter :verify_authenticity_token, only: [ :create ]

  def create
    @user = User.new(user_params)
    if @user.save
      render :json=> {:success=>true, :email=>@user.email}
    else
      render :json=> {:success=>false}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
