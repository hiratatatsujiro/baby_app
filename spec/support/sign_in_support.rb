module SignInSupport
  def sign_in(user)
    visit new_user_registration_path
    # ユーザー情報を入力する
    fill_in 'user[name]', with: @user.name
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    fill_in 'user[password_confirmation]', with: @user.password_confirmation
    select @user.prefectures.name, from: 'user[prefectures_id]'
    fill_in 'user[city]', with: @user.city
    fill_in 'user[house_number]', with: @user.house_number
    # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する

    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    expect(current_path).to eq(root_path)
  end
end