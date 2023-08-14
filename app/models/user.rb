class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contents, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_contents, through: :bookmarks, source: :content
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # User has many followings through relationships.
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed

  # User has many followers through relationships.
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def following?(user)
followings.include?(user)
  end

  def follow(follow_user_id)
    Relationship.create(followed_id: follow_user_id, follower_id: id)
  end
  
  def unfollow(user_id)
    relationship = Relationship.find_by(followed_id: user_id, follower_id: id)
    relationship.destroy
  end
end
