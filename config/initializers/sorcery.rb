<<<<<<< HEAD
Rails.application.config.sorcery.submodules = [:reset_password]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.reset_password_mailer = UserMailer 
  end
end
=======
Rails.application.config.sorcery.submodules = [:reset_password]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.reset_password_mailer = UserMailer 
  end
end
>>>>>>> origin/main
