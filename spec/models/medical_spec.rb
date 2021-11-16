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
      @medical.day = ""
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Day can't be blank")
    end

    it 'imageがなければ登録できない' do
      @medical.image = nil
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Image can't be blank")
    end

    it 'hospitalがなければ登録できない' do
      @medical.hospital = ""
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Hospital can't be blank")
    end

    it 'name_idがなければ登録できない' do
      @medical.name_id = 1
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Name must be other than 1")
    end

    it 'drug_idがなければ登録できない' do
      @medical.drug_id = 1
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Drug must be other than 1")
    end

    it 'childが紐づけてられていなければ登録できない' do
      @medical.child = nil
      @medical.valid?
      expect(@medical.errors.full_messages).to include("Child must exist")
    end
    
  end

 
end
