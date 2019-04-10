class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by(provider: auth_hash["provider"], uid: auth_hash["uid"])
    puts "\nauthorization\n"
    p @authorization
    puts '\n'
    if @authorization
      render :text => "Welcome back #{@authorization.user.name}! You are logged in."
    else
      user = User.create! :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      @authorization = user.authorizations.create :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      p @authorization
      puts "\nuser\n"
      p user
      puts "\n"
      puts "\nuser.authorizations\n"
      p user.authorizations
      puts '\n'
      render :text => "Hi #{user.name}! You've signed up."
    end
    
    # render :text => auth_hash.inspect
  end

  def failure
  end

  def destroy
    render :text => "logged out"
  end
end
