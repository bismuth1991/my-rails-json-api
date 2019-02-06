require 'rails_helper'

RSpec.describe 'DejaVu Services API', type: :request do
  before(:each) do 
    Service.create(name: "Manicure", price: 15)
    Service.create(name: "Pedicure", price: 28)
    Service.create(name: "Gel Manicure", price: 30)
  end

  describe "GET #index" do 
    before { get "/dejavu_api/services/" }

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "fectches all services" do 
      num_services = JSON.parse(response.body).length
      expect(num_services).to eq(3)
    end

    it "fetches each service in correct format" do 
      JSON.parse(response.body).values.each do |service|
        expect(service).to match_response_schema("dejavu_service")
      end
    end
  end

  describe "POST #create" do 
    before(:each) do 
      post "/dejavu_api/services/", params: {
        service: {
          name: "Gel Pedicure",
          price: 45
        }
      }
    end

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "returns the service in correct json format" do 
      expect(response).to match_response_schema("dejavu_service")
    end
  end
end