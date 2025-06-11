# spec/requests/patients_spec.rb
require 'rails_helper'

RSpec.describe "Patients API", type: :request do
  let!(:current_user) { User.create!(username: "test_user", password: "secret", full_name: "Test", role: :doctor) }

  it "returns paginated patients" do
   100.times do |i|
      Patient.create!(name: "Patient #{i}", gender: "male", phone: "12345678#{i}")
    end

    get "/patients", params: { page: 1, per_page: 10 }, headers: { "X-USER-ID" => current_user.id.to_s }

    expect(response).to have_http_status(:ok)
    json = JSON.parse(response.body)
    expect(json["data"].length).to eq(10)
  end
end
