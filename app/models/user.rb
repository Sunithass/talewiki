class User < ActiveRecord::Base
belongs_to :role 
has_many :tales 
has_many :comments

attr_accessible :age, :country, :email, :first_name, :last_name, :encrypted_password, :user_name

validates_presence_of :user_name, :encrypted_password, :first_name, :last_name, :age, :email, :country
validates_uniqueness_of :user_name
validates_numericality_of :age
validates_format_of :email, :with =>/^([\w]+\.)*[\w]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i, :on => :create, :message => " Email should looks like user@gmail.com"

def check_login
    User.login(self.user_name, self.encrypted_password)
end

def self.login(name,password)
    find(:first, :conditions => ["user_name = ? and encrypted_password = ?",name, password])
end
end
