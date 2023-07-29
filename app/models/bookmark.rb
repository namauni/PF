class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :content
  validates_uniqueness_of :content_id, scope: :user_id 
  # 上のコードは下の書き方と一緒　
  validates :user_id, uniqueness: { scope: :content_id}
  # 一つのユーザーは同じ投稿に対して一回しかブックマークができませんというバリデーション
end
