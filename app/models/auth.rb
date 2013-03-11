class Auth < ActiveRecord::Base
  attr_accessible :access_token, :expires_at, :type, :scope, :code,
                  :user, :client
  belongs_to :user
  belongs_to :client

  def self.with_updated_access_token client, user, scope
    a = where("client_id = ? and user_id = ?", client.id, user.id)[0]
    if a
      a.update_access_token unless a.valid_access_token?
      return a
    end

    a = create(client: client, user: user, code: SecureRandom.hex,
               scope: scope,
               access_token: SecureRandom.hex, expires_at: Time.now + 60.days)
    a.update_access_token
    return a
  end

  def expires_in
    expires_at && (expires_at - Time.now).ceil
  end

  def valid_access_token?
    !access_token.blank? and Time.now < expires_at
  end

  def update_access_token
    access_token = SecureRandom.hex
    expires_at = Time.now + 60.days
    save
  end
end
