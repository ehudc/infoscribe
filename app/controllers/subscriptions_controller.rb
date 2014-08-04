class SubscriptionsController < ApplicationController
  def new
    # id is required to deal with form
    @subscription = Subscription.new(:id => 1)
  end
 
  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save
      redirect_to('/', :notice => "A subscription was successfully sent.")
    else
      flash[:alert] = "Fill each field before submitting."
      render 'new'
    end
  end
end
