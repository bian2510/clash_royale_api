require 'rails_helper'

RSpec.describe Player, type: :model do
  context "when creating a player with required fields" do
    it 'it is valid' do
      player = Player.new(name: "Name", tag: "TAG")
      expect(player).to be_valid
    end
    it 'it is invalid' do
      player = Player.new(unbeaten: true, champion: false)
      expect(player).to_not be_valid
    end
  end
end
