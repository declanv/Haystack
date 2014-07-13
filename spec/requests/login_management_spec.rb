require "rails_helper"
require 'spec_helper.rb'

describe "login management" do
  before :each do
    @new_user = { :format => 'json', :user => { :email => "totallyfake@email.com",:password => "123456", :password_confirmation => "123456", :username => "bigfakeone" }}
    post "/users", @new_user
  end

  it "successfully logs in an existing user" do
    login_info = {:email => "totallyfake@email.com", :password => "123456" }
    post "/sessions", login_info
    body = JSON.parse(response.body)
    expect(body).to include('email')
  end

  it "rejects a login attempt with an incorrect password" do
    false_info = {:email => "totallyfake@email.com", :password => "654321" }
    post "/sessions", false_info
    body = JSON.parse(response.body)
    expect(body).to include('message')
  end

  it "sucessfully logs a user out" do
    get "/log_out", nil, {'HTTP_ACCEPT' => "application/json"}
    expect(response.code).to eq("204")
  end

end
