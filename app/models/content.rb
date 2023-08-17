class Content < ApplicationRecord
    
validates :title, presence: true
validates :text, presence: true
belongs_to :user
has_many :comments, dependent: :destroy
has_many :content_tags, dependent: :destroy
has_many :tags, through: :content_tags
has_many :favorites, dependent: :destroy
has_many :bookmarks, dependent: :destroy

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end

def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
end

def self.looks(search, word)
 if search == "partial_match"
 @content = Content.where("title LIKE? or text LIKE?","%#{word}%","%#{word}%")
 elsif search == "tag_match"
    tag_ids = Tag.where("tag LIKE?","%#{word}%").map(&:id)
    content_id = ContentTag.where(tag_id: tag_ids).map(&:content_id)
 @content = Content.where(id: content_id)
 end
end

 def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_content_tag = Tag.find_or_create_by(tag: new)
      self.tags << new_content_tag
   end
 end
end
