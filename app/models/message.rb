class Message < ApplicationRecord
  
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  belongs_to :room

  validates :content, presence: true, length: { maximum: 500 }

  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
end
