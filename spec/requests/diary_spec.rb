require 'rails_helper'
describe DiariesController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @diary = FactoryBot.create(:diary, user_id: @user.id)
  end


  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get diary_path(@diary)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに子どもの名前が存在する' do
      get diary_path(@diary)
      expect(response.body).to include(@diary.title)
    end

    it 'showアクションにリクエストするとレスポンスに投稿日が存在する' do
      get diary_path(@diary)
      expect(response.body).to include(@diary.day.strftime('%Y年%m月%d日'))
    end

    it 'showアクションにリクエストするとレスポンスに日記が存在する' do
      get diary_path(@diary)
      expect(response.body).to include(@diary.text)
    end

    it 'showアクションにリクエストするとレスポンスにコメント投稿が存在する' do
      get diary_path(@diary)
      expect(response.body).to include("コメント投稿")
    end

    
  end
end
