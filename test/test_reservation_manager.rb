require_relative 'test_helper'

describe Hotel::ReservationManager do
  before do
    @reservation_manager = Hotel::ReservationManager.new
    @date = Date.parse("2020-08-04")
  end
  
  describe "Wave 1" do
    
    describe "Rooms" do
      it "returns a list of rooms" do
        rooms = @reservation_manager.rooms
        expect(rooms).must_be_kind_of Array
      end
      
      it "the list of rooms has 20 elements" do
        rooms = @reservation_manager.rooms
        expect(rooms.length).must_equal 20
      end
    end
    
    describe "Reserve room" do
      
      it "can return an instance of Reservation when provided with start and end dates" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        room_number = rand(1..20)
        # act -- call reserve_room on reservation_manager
        # new_reservation = @reservation_manager.reserve_room(start_date, end_date, room_number)
        new_reservation = @reservation_manager.reserve_room(start_date, end_date, room_number)
        # assert
        expect(new_reservation).must_be_kind_of Hotel::Reservation
      end
      
      it "returns instances of date for start and end date" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        room_number = rand(1..20)
        # act
        new_reservation = @reservation_manager.reserve_room(start_date, end_date, room_number)
        # assert
        expect(new_reservation.start_date).must_be_kind_of Date
        expect(new_reservation.end_date).must_be_kind_of Date
      end
      
      # it "adds the new reservation to the master list of reservations" do
      #   start_date = Date.parse("2019-12-20")
      #   end_date = Date.parse("2019-12-24")
      #   room_number = rand(1..20)
      #   # act
      #   new_reservation = @reservation_manager.reserve_room(start_date, end_date, room_number)
      #   # assert
      #   expect(@reservation_manager.all_reservations.length).must_equal 1

      # end
      
    end
    
    
    
    # describe "Reservations list for specific date" do
    #   it "returns an empty array if there are no reservations" do
    #     reservations_array = []
    
    #     start_date = Date.parse("2019-12-20")
    #     end_date = Date.parse("2019-12-24")
    #     room_number = rand(1..20)
    #     reservation_1 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #     start_date = Date.parse("2019-12-20")
    #     end_date = Date.parse("2019-12-26")
    #     room_number = rand(1..20)
    #     reservation_2 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #     start_date = Date.parse("2020-01-20")
    #     end_date = Date.parse("2020-01-23")
    #     room_number = rand(1..20)
    #     reservation_3 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #     reservations_array = []
    #     reservations_array = Hotel::ReservationManager.reservations(Date.parse("2019-12-01"))
    #     expect(reservations_array.length).must_equal 0
    
    #     reservations_array = Hotel::ReservationManager.reservations(Date.parse("2020-05-02"))
    #     expect(reservations_array.length).must_equal 0
    
    #   end
    
    # it "returns a list of reservations for a provided date" do
    #   start_date = Date.parse("2019-12-20")
    #   end_date = Date.parse("2019-12-24")
    #   room_number = rand(1..20)
    #   reservation_1 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #   start_date = Date.parse("2019-12-20")
    #   end_date = Date.parse("2019-12-26")
    #   room_number = rand(1..20)
    #   reservation_2 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #   start_date = Date.parse("2020-01-20")
    #   end_date = Date.parse("2020-01-23")
    #   room_number = rand(1..20)
    #   reservation_3 = Hotel::Reservation.new(start_date, end_date, room_number)
    
    #   reservations_array = []
    #   reservations_array = Hotel::ReservationManager.reservations(Date.parse("2019-12-21"))
    
    #   expect reservations_array.must_be_kind_of Array
    
    
    # end
    
  end
  
end