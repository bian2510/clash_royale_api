class CreateJoinTableTournamentRound < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tournaments, :rounds do |t|
      # t.index [:tournament_id, :round_id]
      # t.index [:round_id, :tournament_id]
    end
  end
end
