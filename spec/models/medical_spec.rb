require 'rails_helper'

RSpec.describe Medical, type: :model do
  before do
    @medical = FactoryBot.build(:medical)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@medical).to be_valid
    end

    it "memoがなくても登録できる" do
      @medical.memo == ""
      expect(@medical).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'dayがなければ登録できない' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailがなければ登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emaiに@lがなければ登録できない' do
      @user.email = "lopo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'emailが重複していると登録できない' do
      @user.save
      another = FactoryBot.build(:user)
      another.email = @user.email 
      another.valid?
      expect(another.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordがなければ登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = "111aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end


    it 'prefectures_idがなければ登録できない' do
      @user.prefectures_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it 'cityがなければ登録できない' do
      @user.city = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("City can't be blank")
    end
    
  end

 
end
