class Team < ActiveRecord::Base
  has_many :playerships
  has_many :players, through: :playerships, source: :user
  belongs_to :coach, class_name: "User"
end
