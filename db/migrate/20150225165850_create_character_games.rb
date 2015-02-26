class CreateCharacterGames < ActiveRecord::Migration
  def change
    create_table :character_games do |t|
      t.integer :character_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
