class WelcomeController < ApplicationController

  #before_filter :authenticate_user!, :except => :about

  def index
  end

  def about
  end
end
