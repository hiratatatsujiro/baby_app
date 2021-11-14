require 'rails_helper'

RSpec.describe Child, type: :model do
  before do
    @child = FactoryBot.build(:child)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@child).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'nameがなければ登録できない' do
      @child.name = ""
      @child.valid?
      expect(@child.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageがなければ登録できない' do
      @child.image = nil
      @child.valid?
      expect(@child.errors.full_messages).to include("Image can't be blank")
    end

    it 'birthdayがなければ登録できない' do
      @child.birthday = nil
      @child.valid?
      expect(@child.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'gender_idがなければ登録できない' do
      @child.gender_id = 1
      @child.valid?
      expect(@child.errors.full_messages).to include("Gender must be other than 1")
    end

    it 'userが紐づけてられていなければ登録できない' do
      @child.user = nil
      @child.valid?
      expect(@child.errors.full_messages).to include("User must exist")
    end
    
  end

 
end
