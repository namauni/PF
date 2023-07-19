class ContentQuesitionTag < ApplicationRecord
belongs_to :content, optional: true
belongs_to :question, optional: true
belongs_to :tag

  validates :content_or_question, presence: true

  private
    def content_or_question
      content_id.presence or question_id.presence
    end
end
