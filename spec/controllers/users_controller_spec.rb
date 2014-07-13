require 'rails_helper'
require 'spec_helper.rb'

RSpec.describe UsersController, :type => :controller do

  describe 'create user' do
    before :each do
      @new_user = { :format => 'json', :user => { :email => "totallyfake@email.com",:password => "123456", :password_confirmation => "123456", :username => "bigfakeone" }}
    end

    it "enters a new user email and password to the database" do
      expect{ post :create, @new_user }.to change(User,:count).by(1)
    end

    it "does not duplicate an existing user in the database" do
      post :create, @new_user
      expect{ post :create, @new_user}.to_not change(User,:count)
    end
  end
end





