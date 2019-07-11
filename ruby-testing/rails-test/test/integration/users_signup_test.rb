require 'test_helper'

class UsersController < ActionDispatch::IntegrationTest
    test "register with Invalid information" do
        get signup_path
        assert_no_difference 'User.count' do
            post users_path, params: {user:{ :name => "", :email => "user@invalid", :password => "foo", :password_confirmation => "bar " }}
       end
        assert_template 'user/new'

    end
end
