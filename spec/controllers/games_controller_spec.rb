require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do
    it 'Has a max limit of records' do
        FactoryBot.create(:user, username:'my_user', password: '123')
        expect(Game).to receive(:limit).with(described_class::MAX_GAMES_LIST).and_call_original
        request.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w"
        get :get_history, 
            params: { limit: 999 }
  end
end