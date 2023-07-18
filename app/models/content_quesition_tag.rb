class ContentQuesitionTag < ApplicationRecord
belongs_to :content, optional: true
belongs_to :question, optional: true
belongs_to :tag
end
