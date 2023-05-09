class User < ApplicationRecord
  has_one_attached :avatar

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy, inverse_of: "user"
  has_many :liked_tweets, through: :likes, source: :tweet
  
  enum role: { member: 0, admin: 1 }

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :avatar, presence: false
end
