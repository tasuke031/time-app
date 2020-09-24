class Api::ChatsController < ApplicationController
  def index

      # そのグループの情報をインスタンス変数@groupに保存
      @room = Room.find(params[:room_id])
      # idがパラメータで取得するidよりも大きいものを、@groupと関連するメッセージの中から検索する。
      # includesはN+1問題対策
      @new_chats = @room.messages.where('id > ?', params[:id])

      # html形式とjson形式のリクエストでそれぞれ振り分ける
      respond_to do |format|
          format.html
          format.json
      end
  end
end