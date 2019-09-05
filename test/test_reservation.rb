# test/test_reservation.rb

require_relative 'test_helper'

describe Hotel::Reservation do
  
  describe "Initialize" do
    it "can create a new reservation" do
      start_date = Date.new(2020, 01, 01)
      end_date = start_date + 3
      reservation = Hotel::Reservation.new(start_date, end_date, nil)
      expect(reservation).must_be_kind_of Hotel::Reservation
      
    end
  end
  
  # describe "cost" do
  #   it "returns a number" do
  #     start_date = Date.new(2017, 01, 01)
  #     end_date = start_date + 3
  #     reservation = Hotel::Reservation.new(start_date, end_date, nil)
  #     expect(reservation.cost).must_be_kind_of Numeric
  #   end
  # end
end