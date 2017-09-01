class User < ApplicationRecord
  before_save :user_role_create

  has_many :user_roles
  has_many :roles, through: :user_roles

  def user?
    roles.exists?(name: "user")
  end

  def owner!
    self.roles << Role.find_by(name: "owner")
  end

  def owner?
    roles.exists?(name: "owner")
  end

  def user_role_create
    self.roles << Role.find_by(name: "user")
  end

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth[:uid]) do |user|
      user.uid        = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name  = auth["info"]["last_name"]
      user.email      = auth["info"]["email"]
      user.image      = auth["info"]["image"]
      user.token      = auth["credentials"]["token"]
    end
  end
end
