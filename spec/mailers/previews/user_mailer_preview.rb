class UserMailerPreview < ActionMailer::Preview

  def account_activation
    user = User.new(email: 'preview@example.com', name: 'Preview User')
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  def password_reset
    user = User.new(email: 'preview@example.com', name: 'Preview User')
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
