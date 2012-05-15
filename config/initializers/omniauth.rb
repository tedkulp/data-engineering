require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.test?
  provider :open_id, :store => OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
end
