require "rails_helper"
require "pry"

describe ReservationsController do

  describe "GET /reservation" do
    before do
      get :reservation, params: { persons: "30", seat_format: "[[3,5],[2,3],[6,9],[2,4]]" }
    end

    it "test case 1" do
      get :reservation, params: { persons: "30", seat_format: "[[3,5],[2,3],[6,9],[2,4]]" }
      expect(JSON.parse(response.body)).to eq({"table" =>[[["-","-",1],["-","-",7],["-","-",13],["-","-",19],["-","-",23]],[[2,3],[8,9],[14,15]],[[4,"-","-","-","-",5],[10,"-","-","-","-",11],[16,"-","-","-","-",17],[20,"-","-","-","-",21],[24,"-","-","-","-",25],[26,"-","-","-","-",27],[28,"-","-","-","-",29],[30,"-","-","-","-","-"],["-","-","-","-","-","-"]],[[6,"-"],[12,"-"],[18,"-"],[22,"-"]]]})
    end

    it "test case 2" do
      get :reservation, params: { persons: "30", seat_format: "[[3,2],[4,3],[2,3],[3,4]]" }
      expect(JSON.parse(response.body)).to eq({"table" => [[[19,25,1],[21,29,7]],[[2,26,27,3],[8,30,"-",9],[13,"-","-",14]],[[4,5],[10,11],[15,16]],[[6,28,20],[12,"-",22],[17,"-",23],[18,"-",24]]]})
    end

    it "test case 3" do
      get :reservation, params: { persons: "35", seat_format: "[[3,4],[4,3],[2,3],[3,4]]" }
      expect(JSON.parse(response.body)).to eq({"table" => [[[21,29,1],[23,33,7],[25,"-",13],[27,"-",19]],[[2,30,31,3],[8,34,35,9],[14,"-","-",15]],[[4,5],[10,11],[16,17]],[[6,32,22],[12,"-",24],[18,"-",26],[20,"-",28]]]})
    end
  end
end
