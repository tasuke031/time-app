require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    context 'roomが作成できる場合' do
      it 'nameが入力されていればルームが作成できる' do
        expect(@room).to be_valid
      end
    end

    context 'roomが作成できない場合' do
      it 'nameが空だとルーム作成できない' do
        @room.name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Nameを入力してください")
      end

      it '制限時間を選択しないとルーム作成できない' do
        @room.chosen_time = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Chosen timeを入力してください", "Chosen timeは数値で入力してください")
      end

      it '制限時間が0以下だとルーム作成できない' do
        @room.chosen_time = 0
        @room.valid?
        expect(@room.errors.full_messages).to include("Chosen timeは0より大きい値にしてください")
      end

      it '制限時間が25以上だとルーム作成できない' do
        @room.chosen_time = 25
        @room.valid?
        expect(@room.errors.full_messages).to include("Chosen timeは25より小さい値にしてください")
      end
    end
  end
end
