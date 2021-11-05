class Drug < ActiveHash::Base
  self.data = [
    { id: 1, name: "ーー"}, 
    { id: 2, name: 'カルボシステイン'},
    { id: 3, name: 'シロップ'}
  ]
  include ActiveHash::Associations
  has_many :medicals
end