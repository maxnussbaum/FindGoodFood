class HomepageController < ApplicationController

  def home
    
  end
  
  def search
    search_bar = params[:search_bar] || session[:search_bar]
    search_type = params[:search_type] || session[:search_type]
    case search_type
    when 'food'
      redirect_value = '/results/food'
    when 'restaurant'
      redirect_value = '/results/restaurant'
    end
    redirect_value = '/' if search_bar.empty?
    redirect_to redirect_value
  end
  
end