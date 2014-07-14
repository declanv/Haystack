class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [ :create ]
  respond_to :json

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render :json=> {:success=>'ok', :email=>user.email, :user_id=>user.id}, :status=>200
    else
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => {:success=>'ok'}, :status=>204
  end
end
