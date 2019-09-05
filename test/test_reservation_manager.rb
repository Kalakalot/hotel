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
    end
    
    describe "Reserve room" do
      it "can return an instance of Reservation when provided with start and end dates" do
        # arrange
        start_date = Date.parse("2019-12-20")
        end_date = Date.parse("2019-12-24")
        # act
        reservation = Hotel::Reservation.new(start_date, end_date, nil)
        # assert
        expect(reservation).must_be_kind_of Hotel::Reservation
      end
      
    end

  end
end

    
    # xdescribe "wave 2" do
    #   describe "available_rooms" do
    #     it "takes two dates and returns a list" do
    #       start_date = @date
    #       end_date = start_date + 3
    
    #       room_list = @reservation_manager.available_rooms(start_date, end_date)
    
    #       expect(room_list).must_be_kind_of Array
    #     end
    #   end
    # end
    # end