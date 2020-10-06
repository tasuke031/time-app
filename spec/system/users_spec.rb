require 'rails_helper'
# type: :systemでSystem specであるとを明示的にする
RSpec.describe "Users", type: :system do
  # user情報を持ったインスタンス変数を用意
    let(:user){ FactoryBot.build(:user) }
  before do
  end

  context "ユーザー新規登録ができるとき" do
    it "正しい情報が入力されていればユーザー登録できる" do
      # ルートパス(トップページ)へ遷移
      visit root_path
      # 現在いるページに新規登録画面へ遷移するボタンがあることを確認
      expect(page).to have_content('新規登録')
      # 新規登録画面へ遷移
      visit new_user_registration_path
      # fill_inには入力フォームのidの値を指定、withには各ユーザー情報を渡す 
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      # ログインボタンをクリックしたときにUserのレコードが1つ増えたことを確認
      expect{
        find('input[name="commit"]').click
      }.to change{ User.count }.by(1)
      # ログイン後トップページへの遷移を確認
      expect(current_path).to eq root_path
      # トップページの項目が変化していることを確認
      expect(page).to have_content('アカウント編集')
      expect(page).to have_content('ログアウト')

    end
  end

  context "ユーザー新規登録ができないとき" do
    it "ユーザー情報が誤って入力されていると登録できない" do
      visit root_path
      
      expect(page).to have_content('新規登録')

      visit new_user_registration_path

      fill_in 'user_name', with: nil
      fill_in 'user_email', with: nil
      fill_in 'user_password', with: nil
      fill_in 'user_password_confirmation', with: nil

      expect{
        find('input[name="commit"]').click
      }.not_to change{ User.count }

      expect(current_path).to eq user_registration_path
    end
  end

  context "ログインに成功するとき" do
    it "emailとpasswordが正しい組み合わせならログインできる" do
      user.save
      visit new_user_session_path
      expect(current_path).to eq new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq root_path
    end
  end

  context "ログインに失敗するとき" do
    it "emailが空のとき" do
      user.save
      visit new_user_session_path
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq user_session_path
    end

    it "passwordが空のとき" do
      user.save
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      click_button 'ログイン'
      expect(current_path).to eq user_session_path
    end
  end

end
