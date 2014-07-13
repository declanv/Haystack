require "rails_helper"
require 'spec_helper.rb'

describe "login management" do
  before :each do
    @new_user = { :format => 'json', :user => { :email => "totallyfake@email.com",:password => "123456", :password_confirmation => "123456", :username => "bigfakeone" }}
    @login_info = {:email => "totallyfake@email.com", :password => "123456" }
    @false_info = {:email => "totallyfake@email.com", :password => "654321" }
  end

  it "successfully logs in an existing user" do
    post "/users", @new_user
    post "/sessions", @login_info
    body = JSON.parse(response.body)
    expect(body).to include('email')
  end

  it "rejects a login attempt with an incorrect password" do
    post "/users", @new_user
    post "/sessions", @false_info
    body = JSON.parse(response.body)
    expect(body).to include('message')
  end

  it "sucessfully logs a user out" do
    post "/users", @new_user
    delete "/sessions"
    body = JSON.parse(response.body)
    expect(body).to include('success')
  end

end
