require "rails_helper"

RSpec.describe PublicationContentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/publication_contents").to route_to("publication_contents#index")
    end

    it "routes to #new" do
      expect(get: "/publication_contents/new").to route_to("publication_contents#new")
    end

    it "routes to #show" do
      expect(get: "/publication_contents/1").to route_to("publication_contents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/publication_contents/1/edit").to route_to("publication_contents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/publication_contents").to route_to("publication_contents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/publication_contents/1").to route_to("publication_contents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/publication_contents/1").to route_to("publication_contents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/publication_contents/1").to route_to("publication_contents#destroy", id: "1")
    end
  end
end
