require 'rails_helper'

RSpec.describe MedicalComment, type: :model do
  before do
    @medical_comment = FactoryBot.build(:medical_comment)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@medical_comment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'contentが空ならば登録できない' do
      @medical_comment.content = ""
      @medical_comment.valid?
      expect(@medical_comment.errors.full_messages).to include("Content can't be blank")
    end

    it 'userが紐づけてられていなければ登録できない' do
      @medical_comment.user = nil
      @medical_comment.valid?
      expect(@medical_comment.errors.full_messages).to include("User must exist")
    end
    
    it 'medicalが紐づけてられていなければ登録できない' do
      @medical_comment.medical = nil
      @medical_comment.valid?
      expect(@medical_comment.errors.full_messages).to include("Medical must exist")
    end
    
  end

 
end