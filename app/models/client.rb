class Client < ActiveRecord::Base
  attr_accessible :app_id, :app_secret, :name, :redirect_uri
end
