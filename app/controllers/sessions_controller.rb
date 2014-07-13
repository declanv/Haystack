class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [ :create ]
  respond_to :json

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render :json=> {:success=>true, :email=>user.email}
    else
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => {:success=>true}, :status=>204
  end
end
