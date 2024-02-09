class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  default from: "from@example.com"
  def reset_password_email(user)
    @user = User.find(user.id)
<<<<<<< HEAD
    @url  = edit_password_reset_url(@user.reset_password_token, host: "localhost:3000")
=======
    @url  = edit_password_reset_url(@user.reset_password_token,  host: "https://wiblu.net")
>>>>>>> origin/main
    mail(to: user.email, subject: "パスワードリセット")
   end

end
