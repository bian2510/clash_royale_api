class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.string :winner
      t.string :losser

      t.timestamps
    end
  end
end
