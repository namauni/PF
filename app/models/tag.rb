class Tag < ApplicationRecord
has_many :contents, through: :content_qeestion_tags
has_many :questions, through: :content_qeestion_tags
end
