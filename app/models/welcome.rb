class Welcome < ActionMailer::Base
  def subscription_notification(sender)
    @sender = sender

    if sender.subscription_type == "TEST"
      sender.subscription_type = "Category LOGIC TO FILL"
    end

    if sender.subs1 == 'true'
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
