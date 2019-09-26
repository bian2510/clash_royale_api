class Tournament < ApplicationRecord
  has_many :rounds
  validates :clan_tag, presence: true
  validates :time_per_round, presence: true, numericality: { only_integer: true }
  validates :players, presence: true, numericality: { only_integer: true }
  validates :rounds, presence: true, numericality: { only_integer: true }
end
