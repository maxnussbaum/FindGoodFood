class WelcomeController < ApplicationController
  skip_before_filter :can_proceed
  
  
  def login
    if !!session[:user_id]
      redirect_to :home and return
    end
    @action = 'login'
  end
end
