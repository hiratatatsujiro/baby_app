class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :day
  end
end
