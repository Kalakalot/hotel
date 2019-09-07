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
    
    describe "reservations_by_room" do
      it "returns an array of hashes" do
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
        
        reservations_all_rooms = @reservation_manager.reservations_by_room
        
        expect(reservations_all_rooms).must_be_kind_of Array
        expect(reservations_all_rooms[0]).must_be_kind_of Hash
        expect(reservations_all_rooms[1]).must_be_kind_of Hash
      end
      
      it "array is the expected length" do
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
        
        reservations_all_rooms = @reservation_manager.reservations_by_room
        
        expect(reservations_all_rooms.length).must_equal 2
      end
      
      it "hashes store room numbers" do
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        date_range = Hotel::DateRange.new(start_date, end_date)
        room_number = room_number
        reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
        
        # start_date = Date.parse("2019-12-21")
        # end_date = Date.parse("2019-12-25")
        # date_range = Hotel::DateRange.new(start_date, end_date)
        # room_number = room_number
        # reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
        
        reservations_all_rooms = @reservation_manager.reservations_by_room
        expect(reservations_all_rooms[0].has_key?(20)).must_equal true
        
      end
      
      # it "hashes contain expected information" do
      #   start_date = Date.parse("2019-12-20")
      #   end_date = Date.parse("2019-12-24")
      #   date_range = Hotel::DateRange.new(start_date, end_date)
      #   room_number = 10
      #   reservation_1 = @reservation_manager.reserve_room(date_range, room_number)
      
      #   # start_date = Date.parse("2019-12-21")
      #   # end_date = Date.parse("2019-12-25")
      #   # date_range = Hotel::DateRange.new(start_date, end_date)
      #   # room_number = 2
      #   # reservation_2 = @reservation_manager.reserve_room(date_range, room_number)
      
      #   reservations_all_rooms = @reservation_manager.reservations_by_room
      
      #   expect(reservations_all_rooms[0].value?("10")).must_equal true
      # end
      
    end
    
  end
  
end
