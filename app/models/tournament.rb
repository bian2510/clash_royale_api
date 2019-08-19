class Tournament < ApplicationRecord
  validates :clan_tag, presence: true
  validates :time_per_round, presence: true
  validates :players, presence: true
  validates :rounds, presence: true
end
