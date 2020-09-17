class ChatsController < ApplicationController
  
  def index
    @chat = Chat.new
  end

  def create
  end
  
end
