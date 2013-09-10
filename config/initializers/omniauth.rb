Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, '2715985602', 'bb7087ed4f54316182753abbb3e80f83'
end
