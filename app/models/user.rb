class User < ActiveRecord::Base
  attr_accessible :name, :rights, :password
  has_paper_trail :ignore => [:password_sec]
  serialize :rights
  
  def password
    ""
  end
  
  def password= (pass)
    self.password_sec= Digest::SHA1.hexdigest(pass) if pass != ""
  end
  
  def password? (pass)
    self.password_sec == Digest::SHA1.hexdigest(pass)
  end
  
  def can? right
    return true if self.rights["admin"]
    self.rights[right.to_s] rescue false
  end

  def allow right
    self.rights = {} if self.rights.nil?
    self.rights[right.to_s] = true
  end
  
  def disallow right
    self.rights = {} if self.rights.nil?
    self.rights[right.to_s] = false
  end
  
end
