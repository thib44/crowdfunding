require "rails_helper"
require "support/render_views"

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response.body).to match /Listing widgets/im
    end
  end
end
