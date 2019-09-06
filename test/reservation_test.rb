# test/reservation_test.rb

require_relative 'test_helper'

describe Hotel::Reservation do
  
  describe "Initialize" do
    
    it "creates an instance of Reservation" do
      start_date = Date.parse("2020-03-12")
      end_date = Date.parse("2020-03-15")
      range = Hotel::DateRange.new(start_date, end_date)
      room_number = rand(1..20)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "can access reservation start and end date within DateRange object" do
      start_date = Date.parse("2020-03-12")
      end_date = Date.parse("2020-03-15")
      date_range = Hotel::DateRange.new(start_date, end_date)
      room_number = rand(1..20)
      reservation = Hotel::Reservation.new(date_range, room_number)
      expect(reservation.date_range.start_date).must_equal date_range.start_date
      expect(reservation.date_range.end_date).must_equal date_range.end_date
    end

    it "keeps track of the date range" do
      start_date = Date.parse("2020-03-12")
      end_date = Date.parse("2020-03-15")
      range = Hotel::DateRange.new(start_date, end_date)
      room_number = rand(1..20)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation.date_range).must_equal range
    end
    
    it "keeps track of room_number" do
      start_date = Date.parse("2020-03-12")
      end_date = Date.parse("2020-03-15")
      range = Hotel::DateRange.new(start_date, end_date)
      room_number = rand(1..20)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation.room_number).must_equal room_number
    end
  end
  
  describe "cost" do
    it "returns a number" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      room_number = rand(1..20)
      range = Hotel::DateRange.new(start_date, end_date)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation.cost).must_be_kind_of Numeric
    end
    
    it "calculates total nights correctly" do
      start_date = Date.parse("2020-03-12")
      end_date = Date.parse("2020-03-16")
      range = Hotel::DateRange.new(start_date, end_date)
      room_number = rand(1..20)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation.cost / 200).must_equal 4
    end

    it "returns the expected total cost for 3 nights" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      room_number = rand(1..20)
      range = Hotel::DateRange.new(start_date, end_date)
      reservation = Hotel::Reservation.new(range, room_number)
      expect(reservation.cost).must_equal 600
    end

    
  end
end