class Welcome < ActionMailer::Base
  def subscription_notification(sender)
    @sender = sender

    if sender.subscription_type == "TEST"
      sender.subscription_type = "Category LOGIC TO FILL"
    end

    if sender.subs1
      sender.content = "subs1 was checked"
    end

    if sender.subs2
      sender.content << " subs2 was picked also"
    end

    mail(:to => sender.email,
         :from => 'please-change-me-at-config-initializers-devise@example.com',
         :subject => "#{sender.subscription_type}")
  end
end
