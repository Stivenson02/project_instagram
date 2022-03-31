require 'rails_helper'

RSpec.describe "Follows", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/follow/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/follow/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/follow/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
