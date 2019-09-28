class Player < ApplicationRecord
  has_and_belongs_to_many :tournaments
  validates :tag, presence: true
  validates :name, presence: true
end
