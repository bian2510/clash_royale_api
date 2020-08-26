class CreateRandomInvalidModels < ActiveRecord::Migration[6.0]
  def change
    create_table :random_invalid_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
