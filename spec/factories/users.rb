# FactoryBotを使用するための記述です
FactoryBot.define do
  # 以下のように記述することでUserクラス(Userモデル)だと自動で判断してくれます
  factory :user do
    # nameカラムに保存する内容をランダムに生成します
    name {Faker::Name.first_name}
    # emailを自動で生成します
    email {Faker::Internet.email}
    # passwordは確認用も含め同じ値を2度入力しないといけないのでランダムに生成した値を変数化します
    # deviseのpasswordは6文字以上でないといけないのでmin_lengthで6文字以上に設定します
    password = Faker::Internet.password(min_length: 6)
    # passwordとパスワードの確認枠に上記で設定した変数を設定します
    password {password}
    password_confirmation {password}
  end
end
