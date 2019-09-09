# reservation_manager_test.rb

require_relative 'test_helper'
require 'pry'

describe Hotel::ReservationManager do
  before do
    @reservation_manager = Hotel::ReservationManager.new
    @date = Date.parse("2020-08-04")
  end
  
  describe "Wave 1" do
    
    describe "rooms" do
      it "returns a list of rooms" do
        rooms = @reservation_manager.rooms
        expect(rooms).must_be_kind_of Array
      end
      
      it "the list of rooms has 20 elements" do
        rooms = @reservation_manager.rooms
        expect(rooms.length).must_equal 20
      end
    end
    
    describe "reserve_room" do
      
      it "returns an instance of Reservation when provided with start and end dates" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        range = Hotel::DateRange.new(start_date, end_date)

        # room_number = rand(1..20)
        
  
        new_reservation = @reservation_manager.reserve_room(range)
        # assert
        expect(new_reservation).must_be_kind_of Hotel::Reservation
      end
      
      it "can look inside date_range and return instances of date for start and end date" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        # act
        new_reservation = @reservation_manager.reserve_room(date_range)
        # assert
        expect(new_reservation.date_range.start_date).must_be_kind_of Date
        expect(new_reservation.date_range.end_date).must_be_kind_of Date
      end
      
      it "adds the new reservation to the collection of all reservations" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        # act
        reservation = @reservation_manager.reserve_room(date_range)
        # assert
        expect @reservation_manager.all_reservations.include?(reservation)
      end 
      
      it "the elements in the collection of all reservations are an instance of Reservation" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        # act
        reservation = @reservation_manager.reserve_room(date_range)
        # assert
        expect(@reservation_manager.all_reservations[0]).must_be_kind_of Hotel::Reservation
      end
      
    end
    
    
    describe "reservations(date)" do
      it "returns an empty array if there are no reservations for the date provided" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        # act
        reservations_for_date = @reservation_manager.reservations(Date.parse("2021-01-01"))   
        
        # assert
        expect(reservations_for_date.length).must_equal 0
        
      end
      
      it "returns an array with the expected number of matching reservations" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-26")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_2 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2020-01-20")
        end_date = Date.parse("2020-01-23")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_3 = @reservation_manager.reserve_room(date_range)
        # act
        reservations_for_date = @reservation_manager.reservations(Date.parse("2019-12-22"))   
        # assert
        expect(reservations_for_date.length).must_equal 2
        
      end
      
      it "returns an array of reservation objects for reservations matching date" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        # act
        reservations_for_date = @reservation_manager.reservations(Date.parse("2019-12-22"))   
        
        # assert
        expect(reservations_for_date[0]).must_be_kind_of Hotel::Reservation
      end
      
    end
  end
  
  describe "Wave 2" do
    
    describe "reservations_by_rooms" do
      
      it "returns a hash" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2019-12-21")
        end_date = Date.parse("2019-12-25")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_2 = @reservation_manager.reserve_room(date_range)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations).must_be_kind_of Hash
      end
      
      it "hash is the expected length" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 5
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2019-12-21")
        end_date = Date.parse("2019-12-25")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 6
        reservation_2 = @reservation_manager.reserve_room(date_range)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.length).must_equal 2
      end
      
      it "hash key is the expected integer" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.has_key?(1)).must_equal true
        
      end
      
      it "hash values can store multiple date_ranges" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2020-01-15")
        end_date = Date.parse("2020-01-16")
        date_range = Hotel::DateRange.new(start_date, end_date)
       reservation_2 = @reservation_manager.reserve_room(date_range)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.values).must_be_kind_of Array
        
        expect(room_reservations[1]).must_equal [reservation_1, reservation_2]
        
      end
    end
    
    describe "rooms_available" do
      
      before do 
        start_date = Date.parse("2019-12-20")
        end_date = start_date + 10
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 5
        reservation_1 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2019-12-21")
        end_date = start_date + 4
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 6
        reservation_2 = @reservation_manager.reserve_room(date_range)
        
        start_date = Date.parse("2020-01-01")
        end_date = start_date + 1
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 6
        reservation_2 = @reservation_manager.reserve_room(date_range)
        
      end
      
      it "returns an array" do
        
        start_date = Date.parse("2019-12-22")
        end_date = Date.parse("2019-12-24")
        test_date_range = Hotel::DateRange.new(start_date, end_date)
        
        available_rooms = @reservation_manager.rooms_available(test_date_range)
        
        expect(available_rooms).must_be_kind_of Array
        
      end
      
      it "rooms with overlapping reservations are not included" do
        start_date = Date.parse("2019-12-22")
        end_date = Date.parse("2019-12-24")
        test_date_range = Hotel::DateRange.new(start_date, end_date)
        
        available_rooms = @reservation_manager.rooms_available(test_date_range)
        
        expect(available_rooms).must_equal [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      end

      it "rooms with non-overlapping reservations are included" do
        start_date = Date.parse("2020-01-22")
        end_date = start_date + 3
        test_date_range = Hotel::DateRange.new(start_date, end_date)
        
        available_rooms = @reservation_manager.rooms_available(test_date_range)
        
        expect(available_rooms).must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
      end
      
    end
    
    describe "reserve_room" do
      before do 
      start_date = Date.parse("2019-12-20")
      end_date = start_date + 10
      date_range = Hotel::DateRange.new(start_date, end_date)
      reservation_1 = @reservation_manager.reserve_room(date_range)
      
      start_date = Date.parse("2019-12-21")
      end_date = start_date + 4
      date_range = Hotel::DateRange.new(start_date, end_date)
      reservation_2 = @reservation_manager.reserve_room(date_range)
      
      start_date = Date.parse("2020-01-01")
      end_date = start_date + 1
      date_range = Hotel::DateRange.new(start_date, end_date)
      reservation_2 = @reservation_manager.reserve_room(date_range)
      end

      it "reservation will not overlap another reservation for the room" do
        
        start_date = Date.parse("2019-12-22")
        end_date = Date.parse("2019-12-24")
        test_date_range = Hotel::DateRange.new(start_date, end_date)
        
        requested_reservation = @reservation_manager.reserve_room(test_date_range)
        
        expect(requested_reservation.room_number).must_equal 3

      end
    end
    
  end
end


