class Question < ApplicationRecord
    
validates :title, presence: true
validates :text, presence: true
belongs_to :user
has_many :questions_comments, dependent: :destroy
has_many :question_tags, dependent: :destroy
has_many :tags, through: :question_tags

 def self.looks(search, word)
 if search == "partial_match"
 @question = Question.where("title LIKE? or text LIKE?","%#{word}%","%#{word}%")
 elsif search == "tag_match"
    tag_ids = Tag.where("tag LIKE?","%#{word}%").map(&:id)
    question_id = QuestionTag.where(tag_id: tag_ids).map(&:question_id)
 @question = Question.where(id: question_id)
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
      new_question_tag = Tag.find_or_create_by(tag: new)
      self.tags << new_question_tag
   end
 end
end
