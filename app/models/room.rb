class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :chosen_time, presence: true
  validates :chosen_time, numericality: { only_integer: true ,greater_than_or_equal: 0, less_than: 25}
end
