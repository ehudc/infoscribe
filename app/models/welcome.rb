class Welcome < ActionMailer::Base
  def subscription_notification(sender)
    @sender = sender

    if sender.subs1 == 'true'
      sender.subscription_type = "Infoscribe: Cat Fact"
      response = JSON.parse(HTTParty.get('http://catfacts-api.appspot.com/api/facts'))
      sender.content = response['facts'][0]
    end

    if sender.subs2 == 'true'
      sender.content << " subs2 was picked also"
    end

    mail(:to => sender.email,
         :from => 'please-change-me-at-config-initializers-devise@example.com',
         :subject => "#{sender.subscription_type}")
  end
end
