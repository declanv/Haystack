require "rails_helper"
require 'spec_helper.rb'

describe "login management" do
  before :each do
    @new_user = { :format => 'json', :user => { :email => "totallyfake@email.com",:password => "123456", :password_confirmation => "123456", :username => "bigfakeone" }}
    @login_info = {:email => "totallyfake@email.com", :password => "123456" }
  end

  it "successfully logs in an existing user" do
    post "/users", @new_user
    post "/sessions", @login_info
    body = JSON.parse(response.body)
    expect(body).to include('email')
  end

end
