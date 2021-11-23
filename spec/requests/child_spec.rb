require 'rails_helper'
describe ChildrenController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @child = FactoryBot.create(:child, user_id: @user.id)
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

  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get child_path(@child)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに子どもの名前が存在する' do
      get child_path(@child)
      expect(response.body).to include(@child.name)
    end

    it 'showアクションにリクエストするとレスポンスに子どものの生年月日が存在する' do
      get child_path(@child)
      expect(response.body).to include(@child.birthday.strftime('%Y年%m月%d日'))
    end

    it 'showアクションにリクエストするとレスポンスに子どもの性別が存在する' do
      get child_path(@child)
      expect(response.body).to include(@child.gender.name)
    end

    it 'showアクションにリクエストするとレスポンスに通院登録のボタンが存在する' do
      get child_path(@child)
      expect(response.body).to include("通院登録")
    end

    
  end
end
