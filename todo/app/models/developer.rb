class Developer < ActiveRecord::Base
 validates :email, uniqueness: true
  has_secure_password
  has_many :entries

end
