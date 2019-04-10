OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer if Rails.env.development?
    provider :github, '2060b14d94c254653210', '36d8c492e7905333ab5894c5bddb34c0081b4b50',
    {   :name => 'github',
        :scope => ['read:user', 'user:email']}
end