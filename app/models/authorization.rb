class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true
  validates_uniqueness_of :uid, scope: :provider
  
  def self.exists? auth
      !!(Authorization.find_with_omniauth(auth))
  end
  
  def self.find_with_omniauth auth
      Authorization.find_by(uid: auth['uid'], provider: auth['provider'])
  end
  
  def self.create_with_omniauth auth
      create!(uid: auth['uid'], provider: auth['provider'])
  end
end
