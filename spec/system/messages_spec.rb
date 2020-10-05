require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @message = FactoryBot.build(:message)
    sign_in(user)
  end

  context "メッセージの投稿ができる場合" do
    it "メッセージが入力されていれば投稿できる", js: true do
      visit room_path(@room)
      expect(current_path).to eq room_path(@room)
      fill_in 'message_content', with: @message.content
      # attach_file 'image_info', "#{Rails.root}/spec/factories/4d1a60d2d1c563f32b4db79507344130.jpg"
      click_on '送信'
      expect(page).to have_content @message.content
      # expect(page).to have_content("cooltext364460306406263.png")
    end
  end

end
