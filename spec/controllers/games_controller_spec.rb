require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
    it 'Has a max limit of records' do
        expect(Game).to receive(:limit).with(described_class::MAX_GAMES_LIST).and_call_original
        get :get_history, params: { limit: 999 }
    end
end