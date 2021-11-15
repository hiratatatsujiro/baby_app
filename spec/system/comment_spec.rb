require 'rails_helper'

RSpec.describe 'コメント新規登録', type: :system do
  before do
    @diary = FactoryBot.create(:diary)
    @comment = FactoryBot.create(:comment)
  end

  context 'コメント新規投稿ができるとき' do 
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
      expect(page).to have_content(@diary.title)
      visit diary_path(@diary)
      expect(current_path).to eq(diary_path(@diary))
      fill_in 'comment[text]', with: @comment.text
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      expect(current_path).to eq(diary_path(@diary))
    end
  end

  context '日記投稿ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
     # トップページにいる
     visit root_path
     # 学級通信一覧ページへのボタンがあることを確認する
     expect(page).to have_no_content(@comment.diary.title)
    end
 end
end

