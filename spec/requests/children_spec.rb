require 'rails_helper'
describe ChildrenController, type: :request do

  before do
    @child = FactoryBot.create(:child)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get children_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスにnameが存在する' do
      get children_path
      expect(response.body).to include(@child.name)
    end

    it 'indexアクションにリクエストするとレスポンスにimageが存在する' do
      get children_path
      expect(response.body).to include(@child.image)
    end
  end

  # describe 'GET #show' do
  #   it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
  #     get contact_path(@contact)
  #     expect(response.status).to eq 200
  #   end

  #   it 'showアクションにリクエストするとレスポンスに連絡者の名前が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.user.last_name)
  #   end

  #   it 'showアクションにリクエストするとレスポンスに連絡者の名前が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.user.first_name)
  #   end

  #   it 'showアクションにリクエストするとレスポンスに学級通信の書いた日が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.created_at.strftime('%Y/%m/%d %H:%M'))
  #   end

  #   it 'showアクションにリクエストするとレスポンスに学級通信の書いた日が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.condition.name)
  #   end

  #   it 'showアクションにリクエストするとレスポンスに学級通信の書いた日が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.reason)
  #   end

  #   it 'showアクションにリクエストするとレスポンスに学級通信の書いた日が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.pool_marathon.name)
  #   end

  #   it 'showアクションにリクエストするとレスポンスに学級通信の書いた日が存在する' do
  #     get contact_path(@contact)
  #     expect(response.body).to include(@contact.contact)
  #   end
  # end
end
