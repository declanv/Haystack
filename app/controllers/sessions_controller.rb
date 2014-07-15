class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [ :create ]
  respond_to :json

  #rudylee solution
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
  end
  # end rudylee solution

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render :json => { :success=>'ok', :email=>user.email, :user_id => user.id}, :callback => params['callback'], :status=>200
    else
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :callback => params['callback'], :status=>401

    end
  end

  def destroy
    session[:user_id] = nil
    render :json => {:success=>'ok'}, :status=>204
  end
end
