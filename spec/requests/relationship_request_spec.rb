require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  describe "GET /accept_friend_request" do
    it "returns http success" do
      get "/relationship/accept_friend_request"
      expect(response).to have_http_status(:success)
    end
  end

end
