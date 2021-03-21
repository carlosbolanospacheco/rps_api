class AddBotMoveToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :bot_move, :string
  end
end
