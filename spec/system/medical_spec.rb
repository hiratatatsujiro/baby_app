require 'rails_helper'

RSpec.describe '通院登録', type: :system do
  before do
    @medical = FactoryBot.create(:medical)
  end

  context '通院新規投稿ができるとき' do 
    it '正しい情報を入力すれば新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @medical.child.user.email
      fill_in 'user[password]', with: @medical.child.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content(@medical.child.name)
      visit child_path(@medical.child)
      expect(page).to have_content("通院登録")
      visit new_child_medical_path(@medical.child, @medical)
      select 2021 ,from: 'medical[day(1i)]'
      select 4 ,from: 'medical[day(2i)]'
      select 4 ,from: 'medical[day(3i)]'
      image_path = Rails.root.join('public/images/sample1.png')
      attach_file('medical[image]',image_path, make_visible: true)
      fill_in 'medical[hospital]', with: @medical.hospital
      select @medical.name.name ,from: 'medical[name_id]'
      select @medical.drug.name ,from: 'medical[drug_id]'
      fill_in 'medical[memo]', with: @medical.memo
      expect{
        find('input[name="commit"]').click
      }.to change { Medical.count }.by(1)
      expect(current_path).to eq(child_path(@medical.child))
      expect(page).to have_content(@medical.hospital)
    end
  end

  context '通院投稿ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
     # トップページにいる
     visit root_path
     # 学級通信一覧ページへのボタンがあることを確認する
     expect(page).to have_no_content(@medical.child.name)
    end
 end
end

RSpec.describe '日記詳細', type: :system do
  before do
    @medical = FactoryBot.create(:medical)
  end
  it 'ログインしたユーザーは通院詳細ページに遷移するとコメントすると表示される' do
    # ログインする
    visit root_path
    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'user[email]', with: @medical.child.user.email
    fill_in 'user[password]', with: @medical.child.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # ログアウトボタンが表示されることを確認する
    expect(page).to have_content(@medical.child.name)
    visit child_path(@medical.child)
    expect(page).to have_content(@medical.hospital)
    visit child_medical_path(@medical.child, @medical)
    expect(page).to have_content("コメントする")
  end

  it 'ログインしていない状態で詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # 学級通信一覧ページへのボタンがあることを確認する
    expect(page).to have_no_content(@medical.child.name)
  end
end

