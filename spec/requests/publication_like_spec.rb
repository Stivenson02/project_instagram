require 'rails_helper'

RSpec.describe "PublicationLikes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/publication_like/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/publication_like/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/publication_like/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
