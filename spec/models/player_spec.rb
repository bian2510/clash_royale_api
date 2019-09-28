require 'rails_helper'

RSpec.describe Player, type: :model do
  context "Create a player" do
    it 'with required fields' do
      player = Player.new(name: "Name", tag: "TAG")
      expect(player).to be_valid
    end
  end
  
  context "Can't create a player" do
    it 'If required fields is missing' do
      player = Player.new(unbeaten: true, champion: false)
      expect(player).to_not be_valid
    end
  end
end
