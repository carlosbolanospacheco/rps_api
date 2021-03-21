module RockPaperScissors

    class RPS_Game
        include Singleton

        # JSON with the possible moves and the option that is beaten by each move
        MOVES={rock: :scissors, paper: :rock, scissors: :paper}.freeze
        
        def valid_move?(move)
            MOVES.key?(move.to_sym)
        end

        def make_move
            MOVES.keys.sample
        end

        def draw?(user_move:, bot_move:)
            user_move == bot_move
        end

        def beats?(user_move:, bot_move:)
            MOVES[user_move.to_sym] == bot_move.to_sym
        end

        def winner?(user_move:, bot_move:, user_name:)
            return 'draw' if draw?(user_move: user_move, 
                                   bot_move: bot_move.to_s)
            return user_name.to_s if beats?(user_move: user_move, 
                                       bot_move: bot_move)
            return 'bot'
        end
    
    end
end