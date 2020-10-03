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
    end
  end
end
