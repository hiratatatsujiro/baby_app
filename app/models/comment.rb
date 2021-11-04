class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :text, presence: true
end
