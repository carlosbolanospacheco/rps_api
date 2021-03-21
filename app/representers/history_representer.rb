class HistoryRepresenter
    
    def initialize(games, offset, limit, total)
        @games = games
        @offset = offset
        @limit = limit
        @total = total
    end

    def as_json
        result = {total_games: total, first_game: offset.to_i+1, games: []}
        games.map.with_index(offset.to_i+1) do |game, index|
            result[:games] << 
            {
                game: index,
                date: game.created_at.strftime("%FT%T"),
                moves: [
                    {
                    name: game.user,
                    move: game.move
                    },
                    {
                    name: "Bot",
                    move: game.bot_move
                    }
                ],
                winner: game.winner=='draw' ? 'Tied game' : "Winner is #{game.winner}"
            }
        end
        return result
    end

    private

    attr_reader :games, :offset, :total, :limit
end