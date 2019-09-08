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
      room_number = 20
      
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
      reservations_for_date = []
      
      @all_reservations.each do |reservation|
        if date >= reservation.date_range.start_date && date <= reservation.date_range.end_date
          reservations_for_date << reservation
        end
      end
      
      return reservations_for_date
      
    end
    
    def rooms_available(date_range)
      
      available_rooms = []
      
      # create a data structure that lists reservations by room number
      
      
      # loop through each room number: 
      # for each existing reservation, check ...
      #     if reservation.start_date is <something> than the lookup.start_date
      #       &&
      #     if reservation.end_date is <something> than the lookup.end_date
      # false if one or more reservations conflict
      # true if no conflicts
      # return all room numbers that evaluate to true

# what if there are no reservations for the room?

      return available_rooms
      
    end
    
    def reservations_by_rooms
      # helper method to transform @all_reservations into 
      # a hash with room numbers as keys and reservations associated 
      # with those rooms as values (in an array).
      
      room_reservations = Hash.new { |hash,key| hash[key] = [] }
      
      @all_reservations.each do |reservation|
        room_reservations[reservation.room_number] << reservation
      end 
      
      return room_reservations
    end
    
  end
  
end