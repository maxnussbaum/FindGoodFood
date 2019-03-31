class HomepageController < ApplicationController

  def home
    
  end
  
  def search
    search_bar = params[:search_bar] || session[:search_bar]
    search_type = params[:search_type] || session[:search_type]
    if search_bar.empty?
      redirect_to '/'
    else
      session[:search_type] = search_type
      session[:search_bar] = search_bar
      redirect_to controller: 'search', action: search_type, search_bar: search_bar
    end
  end
  
end