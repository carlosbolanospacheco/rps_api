require 'rails_helper'

RSpec.describe "Games", type: :request do

  describe "Errors" do
    it "Tries to play without user name" do
      get "/api/v1/play", params: { move: 'rock' }
      expect(response).to have_http_status(:unprocessable_entity)
      #expect(JSON.parse(response.body)).to eq({'error'=> 'Must indicate user name'})
    end

    it "Tries to play without a move" do
      get "/api/v1/play", params: { name: 'John Doe' }
      expect(response).to have_http_status(:unprocessable_entity)
      #expect(JSON.parse(response.body)).to eq({'error'=> 'Must indicate user name'})
    end

    it "Tries to play with a wrong move" do
      get "/api/v1/play", params: { move: 'rocket', name: 'John Doe' }
      expect(response).to have_http_status(:method_not_allowed)
      expect(JSON.parse(response.body)).to eq({'error'=> 'Invalid move'})      
    end
  end

  describe "Plays a game" do
    it "Sends a move and gets the result of the game" do
      expect {
        get "/api/v1/play", params: { move: 'rock', name: 'John Doe'}      
      }.to change{Game.count}.from(0).to(1)
      expect(response).to have_http_status(:created)
      #expect((response.body).size).to eq(134)
    end
  end

  describe "GET /get_history" do
    it "Gets list of historical games" do
      get "/api/v1/get_history", params: { limit: 1, offset: 2 }
      expect(response).to have_http_status(:ok)
    end
  end

end
