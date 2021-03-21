require 'rails_helper'

RSpec.describe RockPaperScissors do
    describe 'moves' do
        it 'Accept only valid moves' do
           expect(RockPaperScissors::RPS_Game.instance.valid_move?('fake')).to eq(false) 
        end

        it 'Validates good moves' do
            expect(RockPaperScissors::RPS_Game.instance.valid_move?('rock')).to eq(true) 
        end
    end

    describe 'duels' do
        it 'paper beats rock' do
          expect(RockPaperScissors::RPS_Game.instance.beats?(user_move: 'paper', bot_move: 'rock')).to eq(true)
        end
    
        it 'rock beats scissors' do
          expect(RockPaperScissors::RPS_Game.instance.beats?(user_move: 'rock', bot_move: 'scissors')).to eq(true)
        end
    
        it 'scissors beats paper' do
          expect(RockPaperScissors::RPS_Game.instance.beats?(user_move: 'scissors', bot_move: 'paper')).to eq(true)
        end
    end
    
    describe 'draws' do
        it 'paper draws paper' do
          expect(RockPaperScissors::RPS_Game.instance.draw?(user_move: 'paper', bot_move: 'paper')).to eq(true)
        end
    
        it 'scissors draws scissors' do
          expect(RockPaperScissors::RPS_Game.instance.draw?(user_move: 'scissors', bot_move: 'scissors')).to eq(true)
        end
    
        it 'rock draws rock' do
          expect(RockPaperScissors::RPS_Game.instance.draw?(user_move: 'rock', bot_move: 'rock')).to eq(true)
        end
    end

end