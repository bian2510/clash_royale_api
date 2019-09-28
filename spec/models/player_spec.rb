require 'rails_helper'

RSpec.describe Player, type: :model do
  context "Create a player" do
    it 'With name and tag' do
      player = Player.new(name: "Name", tag: "TAG")
      expect(player).to be_valid
    end
    it 'With name, tag, champion and unbeaten' do
      player = Player.new(name: 'Name', tag: 'TAG', champion: true, unbeaten: true)
      expect(player).to be_valid
    end
  end
  
  context "Can't create a player" do
    it 'If tag is missing' do
      player = Player.new(name: "Name", unbeaten: true, champion: false)
      expect(player).to_not be_valid
    end
    it "If name is missing" do
      player = Player.new(tag: "TAG", unbeaten: true, champion: false)
      expect(player).to_not be_valid
    end
  end
end
