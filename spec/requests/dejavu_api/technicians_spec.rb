require 'rails_helper'

RSpec.describe 'DejaVu Technicians API', type: :request do
  let!(:nina) { Technician.create(name: "Nina", pin_number: 1234) }

  before(:each) do 
    Technician.create(name: "Kim", pin_number: 2222)
    Technician.create(name: "Victor", pin_number: 3333)
  end

  describe "GET #index" do 
    before { get "/dejavu_api/technicians/" }

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "fectches all technicians" do 
      num_technicians = JSON.parse(response.body).length
      expect(num_technicians).to eq(3)
    end

    it "fetches each technician in correct json format" do 
      JSON.parse(response.body).values.each do |technician|
        expect(technician).to match_response_schema("dejavu_technician")
      end
    end
  end

  describe "GET #show" do 
    before { get "/dejavu_api/technicians/#{nina.id}" }

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "fetches the right technician" do 
      technician = JSON.parse(response.body)
      expect(technician["name"]).to eq("Nina")
    end

    it "returns the technician in correct json format" do 
      expect(response.body).to match_response_schema("dejavu_technician")
    end
  end

  describe "POST #create" do 
    before(:each) do 
      post "/dejavu_api/technicians/", params: {
        technician: {
          name: "Kevin",
          pin_number: 9999,
          admin: true
        }
      }
    end

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "returns the technician in correct json format" do 
      expect(response.body).to match_response_schema("dejavu_technician")
    end
  end

  describe "PATCH #update" do
    before(:each) do 
      patch "/dejavu_api/technicians/#{nina.id}", params: {
        technician: {
          name: "Chau On",
          pin_number: 4321
        }
      }
    end

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "updates the technician" do 
      updated_nina = Technician.find(nina.id)

      expect(updated_nina.name).to eq("Chau On")
      expect(updated_nina.pin_number).to eq(4321)
    end

    it "returns the updated technician in correct json format" do 
      expect(response.body).to match_response_schema("dejavu_technician")
    end
  end

  describe "DELETE #destroy" do 
    before { delete "/dejavu_api/technicians/#{nina.id}" }

    it "responses with status code of 200" do
      expect(response).to have_http_status(200)   
    end

    it "deletes the service" do
      expect(Technician.find_by_id(nina.id)).to be_nil
      expect(Technician.all.length).to eq(2)
    end
  end
end