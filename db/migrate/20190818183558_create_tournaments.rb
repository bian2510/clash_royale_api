class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :clan_tag
      t.string :first_place
      t.string :second_place
      t.string :best_streak
      t.string :unbeaten
      t.integer :rounds
      # The value of time_per_round is in minutes
      t.integer :time_per_round

      t.timestamps
    end
  end
end
