class User < ActiveRecord::Base
  before_create :set_access_token

  private
  def set_access_token
    self.access_token ||= generate_access_token
  end

  def generate_access_token
    SecureRandom.hex(32)
  end
end
