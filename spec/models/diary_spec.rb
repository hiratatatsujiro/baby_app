require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@diary).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'titleがなければ登録できない' do
      @diary.title = ""
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Title can't be blank")
    end

    it 'imageがなければ登録できない' do
      @diary.image = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Image can't be blank")
    end

    it 'dayがなければ登録できない' do
      @diary.day = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Day can't be blank")
    end

    it 'textがなければ登録できない' do
      @diary.text = ""
      @diary.valid?
      expect(@diary.errors.full_messages).to include("Text can't be blank")
    end

    it 'userが紐づけてられていなければ登録できない' do
      @diary.user = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("User must exist")
    end
    
  end

 
end