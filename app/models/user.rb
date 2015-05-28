require 'bcrypt'
class User < ActiveRecord::Base
  has_many :playerships
  has_many :teams, through: :playerships
  has_many :coached_teams, class_name: "Team", foreign_key: :coach_id

  validates :username, presence: true
  validates :password, length: { minimum: 8 }
  validates :username, format: { with: /([a-z]|[A-Z]){3}\d{3}/,
    message: "must be 3 letters followed by 3 numbers" }
  validates :username, uniqueness: true
  include BCrypt

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

end
