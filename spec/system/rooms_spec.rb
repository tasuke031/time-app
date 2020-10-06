require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  let(:user) {FactoryBot.create(:user)}
  let(:room) {FactoryBot.build(:room)}

  context "ルームが作成できる場合" do
    it "ルーム名、ルームの制限時間が入力されていればルーム作成ができる" do
      sign_in(user)
      expect(current_path).to eq root_path
      expect(page).to have_selector('input[value="作成"]')
      fill_in 'room[name]', with: room.name
      fill_in 'room[chosen_time]', with: room.chosen_time
      click_on '作成'
      expect(page).to have_content room.name
    end
  end
  
  context "ルームが作成できない場合" do
    it "ルーム名とルームの制限時間が空だとルーム作成できない" do
      sign_in(user)
      expect(page).to have_selector('input[value="作成"]')
      fill_in 'room_name', with: ""
      fill_in 'room_chosen_time', with: ""
      expect{
        find('input[type="submit"]').click
      }.not_to change{ Room.count }
    end
  end
end
