class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :role, presence: true


  enum :role, { receptionist: 0, doctor: 1 } 


  def self.authenticate(username, password)
    user = find_by(username: username)
    return nil unless user
    user.authenticate(password)
  end
end 