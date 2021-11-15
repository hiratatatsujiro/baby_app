require 'rails_helper'

RSpec.describe '日記新規登録', type: :system do
  before do
    @diary = FactoryBot.create(:diary)
  end

  context '日記新規投稿ができるとき' do 
    it '正しい情報を入力すれば新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @diary.user.email
      fill_in 'user[password]', with: @diary.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('日記を書く')
      visit new_diary_path
      fill_in 'diary[title]', with: @diary.title
      image_path = Rails.root.join('public/images/sample1.png')
      attach_file('diary[image]',image_path, make_visible: true)
      fill_in 'diary[text]', with: @diary.text
      select 2021 ,from: 'diary[day(1i)]'
      select 4 ,from: 'diary[day(2i)]'
      select 4 ,from: 'diary[day(3i)]'
      expect{
        find('input[name="commit"]').click
      }.to change { Diary.count }.by(1)
      expect(current_path).to eq(root_path)
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_content(@diary.title)
    end
  end

  context '日記投稿ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
     # トップページにいる
     visit root_path
     # 学級通信一覧ページへのボタンがあることを確認する
     expect(page).to have_content('日記を書く')
     visit new_diary_path
     expect(current_path).to eq(new_user_session_path)
    end
 end
end

RSpec.describe '日記詳細', type: :system do
  before do
    @diary = FactoryBot.create(:diary)
  end
  it 'ログインしたユーザーは日記詳細ページに遷移してコメント投稿と表示される' do
    # ログインする
    visit root_path
    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    # 正しいユーザー情報を入力する
    fill_in 'user[email]', with: @diary.user.email
    fill_in 'user[password]', with: @diary.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    expect(page).to have_content(@diary.title)
    visit diary_path(@diary)
    expect(page).to have_content("コメント投稿")
    end

  it 'ログインしていない状態で詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # 学級通信一覧ページへのボタンがあることを確認する
    expect(page).to have_no_content(@diary.title)
  end
end

