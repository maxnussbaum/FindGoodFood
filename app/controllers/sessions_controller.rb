class SessionsController < ApplicationController
  def new
  end

  def nested_hash(nh)
    puts "VALUE is a nested hash"
    p nh
    nh.each_pair do |key, value|
      puts "KEY: #{key}"
      if value.kind_of?(Hash)
        nested_hash(value)
      else
        puts "VALUE: #{value}"
      end
    end
  end

  def create
    auth_hash = request.env['omniauth.auth']
    
    puts "\n raw auth_hash\n"
    p auth_hash
    puts '\n'
    puts "\n auth_hash by key\n"
    auth_hash.each_pair do |key, value|
      puts "KEY: #{key}"
      if value.kind_of?(Hash)
        nested_hash(value)
      else
        puts "VALUE: #{value}"
      end
    end
    
    render :text => auth_hash.inspect
  end

  def failure
  end

  def destroy
  end
end
