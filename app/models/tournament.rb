class Tournament < ApplicationRecord
  has_and_belongs_to_many :players
  validates :clan_tag, presence: true
  validates :time_per_round, presence: true, numericality: { only_integer: true }
  validates :players, presence: true
end
