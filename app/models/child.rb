class Child < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

  with_options presence: true do
    validates :name
    validates :birthday
  end

  validates :prefectures_id, numericality: { other_than: 1,message: "を選択して下さい"}
end
