require 'rails_helper'

RSpec.describe '子ども新規登録', type: :system do
  before do
    @child = FactoryBot.create(:child)
  end

  context '子ども新規登録ができるとき' do 
    it '正しい情報を入力すれば新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @child.user.email
      fill_in 'user[password]', with: @child.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('子どもの登録')
      visit new_child_path
      fill_in 'child[name]', with: @child.name
      image_path = Rails.root.join('public/images/sample1.png')
      attach_file('child[image]',image_path, make_visible: true)
      select @child.gender.name, from: 'child[gender_id]'
      select 2021 ,from: 'child[birthday(1i)]'
      select 4 ,from: 'child[birthday(2i)]'
      select 4 ,from: 'child[birthday(3i)]'
      expect{
        find('input[name="commit"]').click
      }.to change { Child.count }.by(1)
      expect(current_path).to eq(root_path)
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_content(@child.name)
    end
  end

  context '子どもの登録ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
     # トップページにいる
     visit root_path
     # 学級通信一覧ページへのボタンがあることを確認する
     expect(page).to have_content('子どもの登録')
     visit new_child_path
     expect(current_path).to eq(new_user_session_path)
    end
 end
end

RSpec.describe '子ども詳細', type: :system do
  before do
    @child = FactoryBot.create(:child)
  end
  it 'ログインしたユーザーは子ども詳細ページに遷移して通院登録ボタンが表示される' do
    # ログインする
    visit root_path
    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'user[email]', with: @child.user.email
    fill_in 'user[password]', with: @child.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    expect(page).to have_content(@child.name)
    visit child_path(@child)
    expect(page).to have_content("通院登録")
    end
  it 'ログインしていない状態で詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # 学級通信一覧ページへのボタンがあることを確認する
    expect(page).to have_no_content(@child.name)
  end
end

