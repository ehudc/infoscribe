class Subscription
  include ActiveModel::Validations
 
  validates_presence_of :subscription_type, :content
  # form_for needs id attribute
  attr_accessor :id, :email, :subscription_type, :content, :subs1, :subs2
 
  # https://stackoverflow.com/questions/4637321/self-sendmethod-value-does-not-work
  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
 
  def save
    if self.valid?
      Welcome.subscription_notification(self).deliver!
      return true
    end
    return false
  end
end