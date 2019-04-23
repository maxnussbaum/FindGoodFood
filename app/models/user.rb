class User < ActiveRecord::Base
    has_many :authorizations
    validates :name, :email, :presence => true
    
    def self.create_with_omniauth info
        create!(name: info['name'], email: info['email'])
    end
    
    def self.exists? info
        !!(User.find_with_omniauth(info))
    end
    
    def self.find_with_omniauth info
        User.find_by(name: info['name'], email: info['email'])
    end
    
    def add_provider auth
        self.authorizations.create_with_omniauth auth
    end
end
