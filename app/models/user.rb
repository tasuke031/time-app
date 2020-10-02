class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.name = Faker::Name.first_name
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest2
    find_or_create_by(email: 'guest2@example.com') do |user|
      user.name = Faker::Name.last_name
      user.password = SecureRandom.urlsafe_base64
    end
  end
end