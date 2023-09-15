class Tag < ApplicationRecord
has_many :contents, through: :content_tags
has_many :questions, through: :qeestion_tags

validates :name, uniqueness: true, presence: true
end
