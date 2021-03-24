require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
    describe 'POST /authenticate' do
        let(:user) { FactoryBot.create(:user, username:'my_user', password: '123') }

        it 'Authenticates user' do
            post '/api/v1/authenticate', params: { user: user.username, password: user.password }
            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body)).to eq(
                {
                    "token"=>"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w"
                }
            )
        end

        it 'Error on authentication without user' do
            post '/api/v1/authenticate', params: { password: 'pwd' }
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'Error on authentication without password' do
            post '/api/v1/authenticate', params: { user: user.id }
            expect(response).to have_http_status(:unauthorized)            
        end

        it 'returns error when password is incorrect' do
            post '/api/v1/authenticate', params: { user: user.id, password: 'wrong' }
            expect(response).to have_http_status(:unauthorized) 
        end
    end
end