class Child < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
  belongs_to :gender
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :birthday
    validates :image
  end

  validates :gender_id, numericality: { other_than: 1,message: "を選択して下さい"}
end
