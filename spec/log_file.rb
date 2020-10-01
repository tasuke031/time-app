失敗時
Failures:

1) User#create ユーザー登録ができない場合 nameが空だと登録できない
    Failure/Error: expect(@user.errors.full_messages).to include("Name can't be blank")
      expected ["Nameを入力してください"] to include "Name can't be blank"
    # ./spec/models/user_spec.rb:28:in `block (4 levels) in <top (required)>'
    
2つのテストの内1つが失敗時
2 examples, 1 failure

2つとも成功時
2 examples, 0 failures

Failed examples:

rspec ./spec/models/user_spec.rb:15 # User#create ユーザー登録ができない場合 nameが空だと登録できない

