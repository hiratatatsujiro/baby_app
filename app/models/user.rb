class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :children
  has_many :diaries
  has_many :comments
  has_many :medical_comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures

  with_options presence: true do
    validates :name
    validates :city
  end

  validates :prefectures_id, numericality: { other_than: 1,message: "を選択して下さい"}
end
