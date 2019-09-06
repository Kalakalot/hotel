# lib/reservation_manager.rb
module Hotel
  
  class ReservationManager
    
    attr_reader :all_reservations
    
    def initialize
      # create an empty array to hold reservations
      @all_reservations = []
    end
    
    def rooms
      valid_rooms = (1..20)
      room_list = []
      valid_rooms.each do |number|
        room_list << "Room #{number}"
      end
      return room_list
    end
    
    def reserve_room(date_range, room_number)
      
      # define the variables needed for a new reservation
      date_range = date_range
      room_number = rand(1..20)
      
      # instantitate the new reservation
      reservation = Hotel::Reservation.new(
        date_range,
        room_number
      )
      
      # add new reservation to list of all reservations
      @all_reservations << reservation
      
      return reservation
    end
    
    def reservations(date)
      # create an array to hold matching reservations
      reservations_for_date = []
      
      @all_reservations.each do |reservation|
        if date >= reservation.date_range.start_date && date <= reservation.date_range.end_date
          reservations_for_date << reservation
        end
      end
      
      return reservations_for_date
      
    end
    
  end
  
end