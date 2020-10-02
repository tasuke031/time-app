class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

  def new_guest2
    user2 = User.guest2
    sign_in user2
    redirect_to root_path, notice: "ゲストユーザー2としてログインしました"
  end
end