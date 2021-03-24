module Api 
  module V1
    class GamesController < ApplicationController
      include ActionController::HttpAuthentication::Token
      include RockPaperScissors
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      # Max number of games that are sent for one request
      MAX_GAMES_LIST = 20

      before_action :authenticate_user, only: [ :get_history ]

      def play
        params.require(:name)
        params.require(:move)
        if RockPaperScissors::RPS_Game.instance.valid_move?(params[:move]) then
          bot_move = RockPaperScissors::RPS_Game.instance.make_move
          winner = RockPaperScissors::RPS_Game.instance.winner?(user_move: params[:move], 
                                                                bot_move: bot_move, 
                                                                user_name: params[:name])
          game = Game.create(user: params[:name], 
                             move: params[:move], 
                             bot_move: bot_move, 
                             winner: winner)
          render json: GameRepresenter.new(game).as_json, status: :created
        else 
          render json: {error: 'Invalid move'}, status: :method_not_allowed
        end
      end
      
      def get_history
        total = Game.count
        games = Game.limit(limit).offset(params[:offset])
        render json: HistoryRepresenter.new(games, params[:offset], limit, total).as_json, status: :ok
      end

      private

      def authenticate_user
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        head :unauthorized
      end

      def limit
        [
          params.fetch(params[:limit], MAX_GAMES_LIST).to_i,
          MAX_GAMES_LIST
        ].min
      end

      def parameter_missing(e)
        render json: { error: e.message}, status: :unprocessable_entity
      end
    end
  end
end
