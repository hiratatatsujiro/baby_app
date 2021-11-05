class Name < ActiveHash::Base
  self.data = [
    { id: 1, name: "ーー"}, 
    { id: 2, name: 'ヘルパンギーナ'},
    { id: 3, name: '手足口病'}
  ]
  include ActiveHash::Associations
  has_many :medicals
end