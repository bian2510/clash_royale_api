class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :tag
      t.string :name
      t.boolean :champion
      t.boolean :unbeaten

      t.timestamps
    end
  end
end
