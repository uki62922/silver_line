module RoomCreateSupport
  def room_create_support(user)
    visit new_user_registration_path
    fill_in 'user_name', with: "another"
    fill_in 'user_tel', with: "09011111111"
    fill_in 'user_email', with: "another@test"
    fill_in 'user_password', with: "00000a"
    fill_in 'user_password_confirmation', with: "00000a"
    click_on("アカウント作成")
    expect(current_path).to eq root_path

   # チャット相手をログアウトする 
    visit "/users/1/edit"
    click_on("ログアウト")

   # サインインする
    sign_in(@room_user.user)
    
   # フレンド追加する
    visit "/users"
    fill_in '電話番号で探す', with: "09011111111"
    click_on("検索")
    click_on("another さんここを押す")
    click_on("ここを押すと電話帳に追加する")
    
   # 作成されたチャットルームへ遷移する
    click_on("another")
    click_on("anotherさんと話すボタン")
    click_on("another")
  end
end