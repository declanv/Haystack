# require 'rails_helper'
# require 'spec_helper.rb'

# RSpec.describe SessionsController, :type => :controller do

#   describe 'log in process' do
#     before :each do
#       # user = FactoryGirl.create(:user)
#       # user.password = "123456"
#       # user.password_confirmation = "123456"
#       # user.save
#       @user = FactoryGirl.create(:user, :password => '123456', :password_confirmation => '123456')
#       # @user = FactoryGirl.create(:user)
#     end

#     # it "adds a user to the database" do

#     # end

#     it "sucessfully logs in an existing user" do
#       login_info = {:user => {:email => "totallyfake@email.com", :password => "123456" }}
#       post :create, login_info
#       # response.should be_success
#       body = JSON.parse(response.body)
#       expect(body).to include('email')
#     end

#   end
# end
