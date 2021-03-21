class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :user
      t.integer :move
      t.integer :bot_move
      t.integer :winner

      t.timestamps
    end
  end
end
