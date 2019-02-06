require 'rails_helper'

RSpec.describe 'DejaVu Services API', type: :request do
  let!(:gel_manicure) { Service.create(name: "Gel Manicure", price: 30) }

  before(:each) do 
    Service.create(name: "Manicure", price: 15)
    Service.create(name: "Pedicure", price: 28)
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
      expect(response.body).to match_response_schema("dejavu_service")
    end
  end

  describe "PATCH #update" do
    before(:each) do 
      patch "/dejavu_api/services/#{gel_manicure.id}", params: {
        service: {
          price: 35
        }
      }
    end

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "updates the service" do 
      updated_service = JSON.parse(response.body)
      expect(updated_service["price"]).to eq(35)
    end

    it "returns the updated service in correct json format" do 
      expect(response.body).to match_response_schema("dejavu_service")
    end
  end

  describe "DELETE #destroy" do 
    before { delete "/dejavu_api/services/#{gel_manicure.id}" }

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "deletes the service" do
      expect(Service.find_by_id(gel_manicure.id)).to be_nil
      expect(Service.all.length).to eq(2)
    end
  end
end