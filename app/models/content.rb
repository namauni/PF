class Content < ApplicationRecord
    
validates :title, presence: true
validates :text, presence: true
belongs_to :user
has_many :comments, dependent: :destroy
has_many :tags, through: :content_qeestion_tags
has_many :favorites, dependent: :destroy
has_many :bookmarks, dependent: :destroy

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end

def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
end

end
