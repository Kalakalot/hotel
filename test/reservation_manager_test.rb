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
        room_number = rand(1..20)
        # act -- call reserve_room on reservation_manager
        # new_reservation = @reservation_manager.reserve_room(start_date, end_date, room_number)
        new_reservation = @reservation_manager.reserve_room(range, room_number)
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
        new_reservation = @reservation_manager.reserve_room(date_range, room_number)
        # assert
        expect(new_reservation.date_range.start_date).must_be_kind_of Date
        expect(new_reservation.date_range.end_date).must_be_kind_of Date
      end
      
      it "adds the new reservation to the collection of all reservations" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        # act
        reservation = @reservation_manager.reserve_room(date_range, room_number)
        # assert
        expect @reservation_manager.all_reservations.include?(reservation)
      end 
      
      it "the elements in the collection of all reservations are an instance of Reservation" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        # act
        reservation = @reservation_manager.reserve_room(date_range, room_number)
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
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
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
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-26")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2020-01-20")
        end_date = Date.parse("2020-01-23")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_3 = @reservation_manager.reserve_room(date_range, room_number)
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
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
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
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2019-12-21")
        end_date = Date.parse("2019-12-25")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = rand(1..20)
        reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations).must_be_kind_of Hash
      end
      
      it "hash is the expected length" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2019-12-21")
        end_date = Date.parse("2019-12-25")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.length).must_equal 1
      end
      
      it "hash key is a room number" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.has_key?(20)).must_equal true
        
      end
      
      it "hash values can store multiple date_ranges" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2020-01-15")
        end_date = Date.parse("2020-01-16")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
        
        room_reservations = @reservation_manager.reservations_by_rooms
        
        expect(room_reservations.values).must_be_kind_of Array
        
        expect(room_reservations[20]).must_equal [reservation_1, reservation_2]
        
      end
    end
    
    describe "rooms_available" do
      
      it "returns an array" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 5
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        start_date = Date.parse("2019-12-21")
        end_date = Date.parse("2019-12-25")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = 6
        reservation_2 = @reservation_manager.reserve_room(date_range, room_number)

        start_date = Date.parse("2019-12-22")
        end_date = Date.parse("2019-12-24")
        test_date_range = Hotel::DateRange.new(start_date, end_date)
        
        available_rooms = @reservation_manager.rooms_available(test_date_range)
        
        expect(available_rooms).must_be_kind_of Array

      end
   
    end
    
  end
end


