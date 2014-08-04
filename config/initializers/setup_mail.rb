ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address          =>  'smtp.sendgrid.net',
  :port             =>  '587',
  :authentication   =>  :plain,
  :user_name        =>  ENV["SENDGRID_UNAME"],
  :password         =>  ENV["SENDGRID_PASS"],
  :domain           =>  'heroku.com',
  :enable_starttls_auto =>  true
}