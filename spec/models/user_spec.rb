require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題がない場合' do
    it '全ての情報があれば登録できる' do
      expect(@user).to be_valid
    end

    it "番地がなくても登録できる" do
      @user.house_number == ""
      expect(@user).to be_valid
    end
  end

 
end
