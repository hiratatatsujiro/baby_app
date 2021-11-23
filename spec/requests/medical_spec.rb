require 'rails_helper'
describe DiariesController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @child = FactoryBot.create(:child, user_id: @user.id)
    @medical = FactoryBot.create(:medical, child_id: @child.id)
  end


  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get child_medical_path(@child, @medical)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスにnameが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include(@medical.name.name)
    end

    it 'showアクションにリクエストするとレスポンスにdayが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include(@medical.day.strftime('%Y年%m月%d日'))
    end

    it 'showアクションにリクエストするとレスポンスにhospitalが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include(@medical.hospital)
    end

    it 'showアクションにリクエストするとレスポンスにdrugが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include(@medical.drug.name)
    end

    it 'showアクションにリクエストするとレスポンスにmemoが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include(@medical.memo)
    end

    it 'showアクションにリクエストするとレスポンスにコメントが存在する' do
      get child_medical_path(@child, @medical)
      expect(response.body).to include("コメントする")
    end
  end
end
