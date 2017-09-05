class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :password, :presence => true, :confirmation => true
  validates :email, :presence => true, :uniqueness => true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true



  def self.from_omniauth(auth)
    find_or_create_by(uid: auth[:uid]) do |user|
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]
      user.image = auth["info"]["image"]
      user.token = auth["credentials"]["token"]
      user.password = "myshelterpassword"
    end
  end
end
