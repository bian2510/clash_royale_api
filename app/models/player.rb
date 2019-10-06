class Player < ApplicationRecord
  has_and_belongs_to_many :tournaments
  validates :tag, presence: true
  validates :name, presence: true

  def create_players(players_params_create)
    players = []
    players_params_create.each do |player|
      if Player.find_by(tag: player[:tag]).nil?
        player = create_player(player)
        players.push(player)
      else
        players.push(Player.find_by(tag: player[:tag]))
      end
    end
    players
  end

  def create_player(player_params)
    player = Player.new(name: player_params[:name], tag: player_params[:tag], champion: player_params[:champion], unbeaten: player_params[:unbeaten])
    if player.save
      player
    else
      render json: {error: "the player can't be created"}, status: :unprocessable_entity
    end
  end
end
