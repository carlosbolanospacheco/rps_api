require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
    it 'Has a max limit of 20' do
        expect(Game).to receive(:limit).with(20).and_call_original
        get :get_history, params: { limit: 999 }
    end
end