require 'rails_helper'

RSpec.describe Tournament, type: :model do
  before(:each) do
    @peers_players = []
    @odd_players = []
    ["a", "b", "c", "d"].each do |tag|
      player = Player.new
      player.name = "name"
      player.tag = tag
      @peers_players.push(player)
    end
    ["a", "b", "c"].each do |tag|
      player = Player.new
      player.name = "name"
      player.tag = tag
      @odd_players.push(player)
    end
  end
  context "Create a tournament" do
    it "with required fields" do
      tournament = Tournament.new(clan_tag: "CLAN_TAG", time_per_round: 15, rounds: 2, players: @peers_players)
      expect(tournament).to be_valid
    end
  end
  context "Can't create tournament" do
    it "missing required fields" do
      tournament = Tournament.new(clan_tag: "CLAN_TAG", time_per_round: 15, rounds: 2)
      expect(tournament).to_not be_valid
    end
  end
end