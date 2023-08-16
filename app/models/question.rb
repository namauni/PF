class Question < ApplicationRecord
    
validates :title, presence: true
validates :text, presence: true
belongs_to :user
has_many :questions_comments, dependent: :destroy
has_many :tags, through: :content_qeestion_tags

 def self.looks(search, word)
 @question = Question.where("title LIKE? or text LIKE?","%#{word}%","%#{word}%")
 end
end
