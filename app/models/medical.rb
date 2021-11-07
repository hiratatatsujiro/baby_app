class Medical < ApplicationRecord
  belongs_to :child
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :drug
  belongs_to :name

  with_options presence:true do
    validates :day
    validates :hospital
    validates :image
  end  

  with_options numericality: { other_than: 1 } do
    validates :drug_id
    validates :name_id
  end
end
