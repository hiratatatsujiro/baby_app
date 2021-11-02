class Diary < ApplicationRecord
  belongs_to :users
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :date
  end
end
