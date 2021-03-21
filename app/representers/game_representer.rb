class GameRepresenter
    
    def initialize(game)
        @game = game
    end

    def as_json
        {
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

    private

    attr_reader :game

end