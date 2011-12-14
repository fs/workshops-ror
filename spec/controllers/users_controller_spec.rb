require 'spec_helper'

describe UsersController do
  describe '#GET' do
    it "should ..." do
      user = stub_model(User)
      User.stubs(:all).returns([user])
      User.stubs(:find).with(1).returns(user)

      get :index, params: {:user_id => 1}

      assigns(:users).should eq([user])
      assigns(:user1).should eq(user)
    end

  end
end
