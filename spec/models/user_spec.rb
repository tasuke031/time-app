require 'rails_helper'

# describeには何のテストなのかを記述します
# 今回はUserモデルのテストなのでこのようになります
RSpec.describe User, type: :model do
  #ユーザーを新たに作成(登録)するテストなので#createとしています
  describe '#create' do
    # spec/factories/user.rbの内容を呼び出し変数にします
    # スコープが異なるのでローカル変数ではなく@をつけてインスタンス変数にします
    before do
      @user = FactoryBot.build(:user)
    end
    # contextには条件・状況を記述します
    context 'ユーザー登録ができる場合' do
      # itにはテストする項目を記述します
      it 'name, email, password, password_confirmationが正しく入力されていれば新規登録できる' do
        # FactoryBotで作成したuser情報が正しければバリデーションにかからずbe_validでテストをパスします
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない場合' do
      it 'nameが空だと登録できない' do
        # userのnameを空に更新
        @user.name = nil
        # valid?でバリデーションを通るか判定、通らないときはエラーメッセージを生成する
        @user.valid? 
        # @user.errors.full_messagesでエラーメッセージを表示させる
        # include以降に表示されたエラーメッセージを記述する
        # deviseを日本語化していなければName can't be blankというエラーメッセージになると思います
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      # deviseはdefaultでuniquenessという同じ内容は登録できないというバリデーションが設定されています
      it '同じemailはすでに使用されていると登録できない' do
        # uniquenessの確認のためユーザーを二人用意します
        # @userを保存します
        @user.save
        # 2人目のユーザーを作成します
        another_user = FactoryBot.build(:user)
        # another_userのemailを@userと同じemailに更新します
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end

      # deviseはdefaultでpasswordに6文字以上出ないと登録できないというバリデーションが設定されています
      it 'passwordが6文字以下だと登録できない' do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordが正しくてもpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
