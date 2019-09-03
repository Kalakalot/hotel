# test/test_reservation.rb

require_relative 'test_helper'

describe "Initialize reservation" do
  
  it "creates an instance of reservation" do
    start_date = Date.new(2019, 12, 15)
    end_date = Date.new(2019, 12, 18)
    
    reservation = Reservation.new(start_date: start_date, end_date: end_date)
    expect(reservation).must_be_kind_of Reservation
  end

  it "keeps track of start date" do
    start_date = Date.new(2019, 12, 15)
    end_date = Date.new(2019, 12, 18)
    
    reservation = Reservation.new(start_date: start_date, end_date: end_date)
    expect(reservation.start_date).must_equal start_date
  end

  it "keeps track of end date" do
    start_date = Date.new(2019, 12, 15)
    end_date = Date.new(2019, 12, 18)
    
    reservation = Reservation.new(start_date: start_date, end_date: end_date)
    expect(reservation.end_date).must_equal end_date
  end

  it "keeps track of room number" do
    start_date = Date.new(2019, 12, 15)
    end_date = Date.new(2019, 12, 18)
    room_number = 13

    reservation = Reservation.new(start_date: start_date, end_date: end_date, room_number: room_number)
    expect(reservation.room_number).must_equal 13
  end
end
