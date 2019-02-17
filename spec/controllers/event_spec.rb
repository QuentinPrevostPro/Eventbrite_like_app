require 'rails_helper'

RSpec.describe Event, type: :request do
  describe "GET index" do
    it "renders the index template" do
      # va sur index
      get '/events'
  
      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end
end

