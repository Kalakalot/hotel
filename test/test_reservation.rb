# test/test_reservation.rb

require_relative 'test_helper'

describe "Initialize reservation" do
  
  it "creates an instance of reservation" do
    start_date = Date.new(2019, 12, 15)
    end_date = Date.new(2019, 12, 18)
    
    reservation = Reservation.new(start_date: start_date, end_date: end_date)
    expect(reservation).must_be_kind_of Reservation
  end
  
end

