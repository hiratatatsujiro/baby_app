require 'rails_helper'

RSpec.describe 'コメント新規登録', type: :system do
  before do
    @child = FactoryBot.create(:child)
    @medical = FactoryBot.create(:medical, child_id: @child.id)
    @medical_comment = FactoryBot.create(:medical_comment)
  end

  context 'コメント新規投稿ができるとき' do 
    it '正しい情報を入力すれば新規登録ができて詳細に移動する' do
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
      expect(page).to have_content(@child.name)
      visit child_path(@child)
      expect(page).to have_content(@medical.hospital)
      visit child_medical_path(@child, @medical)
      fill_in 'medical_comment[content]', with: @medical_comment.content
      expect{
        find('input[name="commit"]').click
      }.to change { MedicalComment.count }.by(1)
      expect(current_path).to eq(child_medical_path(@child, @medical))
    end
  end

  context 'コメント投稿ができないとき'do
    it 'ログインしていないと投稿ページに遷移できない' do
     # トップページにいる
     visit root_path
     # 学級通信一覧ページへのボタンがあることを確認する
     expect(page).to have_no_content(@child.name)
    end
 end
end

