require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it "should return 200" do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end
end
