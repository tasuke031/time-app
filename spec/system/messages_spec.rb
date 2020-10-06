require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @message = FactoryBot.build(:message)
    @image_path = Rails.root.join('spec/factories/4d1a60d2d1c563f32b4db79507344130.jpg')
    sign_in(user)
  end

  context "メッセージの投稿が成功する場合" do
    it "メッセージが入力されていれば投稿できる", js: true do
      visit room_path(@room)
      expect(current_path).to eq room_path(@room)
      fill_in 'message_content', with: @message.content
      attach_file('message_avatar', @image_path, make_visible: true)
      click_on '送信'
      expect(page).to have_content @message.content
      expect(page).to have_selector('img')
    end
  end

  context "メッセージの投稿が失敗する場合" do
    it "メッセージが空だと投稿できない" do
      visit room_path(@room)
      expect(current_path).to eq room_path(@room)
      fill_in 'message_content', with: nil
      # message_contentを入力しないとdisabled属性が外れないので送信ボタンをクリックできない
      expect(page).to have_selector('input[class="btn btn-primary btn-block disabled"]')
    end
  end

end
