class AddMoveToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :move, :string
  end
end
