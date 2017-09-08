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

  def self.from_fb(auth)
    # b = auth[:data][:scopes] future reference... fb is hard to pull user email FN and LN from... but maybe you brownfield folks have an idea
    user = User.new
    user.uid = auth[:data][:user_id]
    user.uid = @token
    user.save

    # a = User.create(uid: auth[:data][:user_id], token: @token)

    byebug
    # user = find_or_create_by(uid: auth[:data][:user_id]) do |user|
    #   user.uid        = auth[:data][:user_id]
    #   user.token      = @token
    # end

  end

  def self.fb_token_call(code)
    response = Faraday.get("https://graph.facebook.com/v2.10/oauth/access_token?client_id=#{ENV['FACEBOOK_APP_ID']}&redirect_uri=http://localhost:3000/users/new&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&code=#{code}")
    @token = response.body.split(/\W+/)[2]
    oauth_response = Faraday.get("https://graph.facebook.com/debug_token?input_token=#{@token}&access_token=#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}")
    JSON.parse(oauth_response.body, symbolize_names: true)
  end

  def self.update_or_create(user_info)
    user = User.find_by(strava_id: user_info[:id]) || User.new
    user.access_token =       @token
    user.strava_id =          user_info[:id]
    user.strava_username =    user_info[:username]
    user.first_name =         user_info[:firstname]
    user.last_name =          user_info[:lastname]
    user.email =              user_info[:email]
    user.save!
    user
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
    self.roles << Role.find_by(name: "user")
  end
end
