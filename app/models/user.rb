class User < ApplicationRecord
  before_save :user_role_create

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :properties

  has_many :reservations

  has_secure_password
  validates_confirmation_of :password
  validates :password, :presence => true, :confirmation => true
  validates :email, :presence => true, :uniqueness => true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  #validates :email, presence: true, uniqueness: true


  def self.from_omniauth(auth)
    user = find_or_create_by(uid: auth[:uid]) do |user|
      user.uid        = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name  = auth["info"]["last_name"]
      user.email      = auth["info"]["email"]
      user.image      = auth["info"]["image"]
      user.token      = auth["credentials"]["token"]
      user.password   = "password"
    end
  end

  def user?
    roles.exists?(name: "user")
  end

  def owner!
    self.roles << Role.find_by(name: "owner")
  end

  def owner?
    roles.exists?(name: "owner")
  end

  private

  def user_role_create
    self.roles << (Role.find_by(name: "user"))
  end
end
