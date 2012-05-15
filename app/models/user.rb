class User < ActiveRecord::Base
  attr_accessible :login, :name, :provider, :uid

  cattr_accessor :current_user

  def self.from_omniauth(auth)
    where(:provider => auth['provider'], :uid => auth['uid']).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
