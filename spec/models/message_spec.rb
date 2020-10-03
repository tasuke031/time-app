require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    context 'メッセージが投稿できる場合' do
      it 'messageが入力されていれば投稿できる' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージが投稿できない場合' do
      it 'messageが空だと投稿できない' do
        @message.content = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
    end
  end
end
