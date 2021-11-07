class MedicalComment < ApplicationRecord
  belongs_to :user
  belongs_to :child
  belongs_to :medical

  validates :content, presence: true
end
