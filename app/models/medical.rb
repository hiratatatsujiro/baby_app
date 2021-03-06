class Medical < ApplicationRecord
  has_many :medical_comments
  belongs_to :child
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :drug
  belongs_to :name

  with_options presence:true do
    validates :day
    validates :hospital
    validates :images
  end  

  with_options numericality: { other_than: 1 } do
    validates :drug_id
    validates :name_id
  end
end
