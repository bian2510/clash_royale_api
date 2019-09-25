class CreateJoinTableTournamentPlayer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tournaments, :players do |t|
      t.index [:tournament_id, :player_id]
      t.index [:player_id, :tournament_id]
    end
  end
end
