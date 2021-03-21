class RemoveMoveFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :move, :integer
  end
end
