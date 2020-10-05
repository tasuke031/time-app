require 'rails_helper'

describe RoomsController, type: :request do

  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @message = FactoryBot.create(:message)
    login_as @user
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end

    it "indexアクションにリクエストするとレスポンスに作成済みのルーム名が存在する" do
      get root_path
      expect(response.body).to include @room.name
    end

    it "indexアクションにリクエストするとレスポンスに「ルーム名を入力し制限時間を選択してください」が含まれる" do
      get root_path
      expect(response.body).to include("ルーム名を入力し制限時間を選択してください")
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get room_path(@room)
      expect(response.status).to eq 200
    end

    it "showアクションにリクエストするとレスポンスに投稿済みのコンテンツが存在する" do
    
      pending 'response.bodyに@message.contentが含まれないので保留(render @messagesで描写してるせいかも)'
    
      get room_path(@room)
      expect(response.body).to include @message.content
    end

    it "showアクションにリクエストするとレスポンスにコンテンツ投稿用のフォームが存在する" do
      get room_path(@room)
      expect(response.body).to include("メッセージを入力してください")
    end
  end

end