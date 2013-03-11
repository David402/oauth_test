class Auth < ActiveRecord::Base
  attr_accessible :access_token, :expires_at, :type, :user_id
end
