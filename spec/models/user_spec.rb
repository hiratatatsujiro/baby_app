require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = "111aaa"
      expect(@user).to be_valid
    end

    it "番地がなくても登録できる" do
      @user.house_number == ""
      expect(@user).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'nameがなければ登録できない' do
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
