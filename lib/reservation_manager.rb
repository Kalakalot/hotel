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
    
    def reserve_room(date_range)
      
      # define the variables needed for a new reservation
      date_range = date_range
      
      # assign room_number from list of available rooms and remove asssigned room from the list
      room_number = (rooms_available(date_range)).shift

      if (rooms_available(date_range)).length  == 0
        raise ArgumentError.new(
          "Ack! All rooms are booked for the requested dates"
        )
      end

      
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
    
    def reservations_by_rooms
      # helper method to transform @all_reservations into a hash with room # numbers as keys and reservations associated with those rooms as 
      # values (in an array).
      
      room_reservations = Hash.new { |hash,key| hash[key] = [] }
      
      @all_reservations.each do |reservation|
        room_reservations[reservation.room_number] << reservation
      end 
      
      return room_reservations
    end
    
    def rooms_available(requested_range)
      
      available_rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

      room_reservations = self.reservations_by_rooms
      
      # look at each element in the hash
      room_reservations.each do |room_number, reservations|
        # loop through the array of reservations associated with the room number
        reservations.each do |reservation|
          # if a reservation range overlaps
          if reservation.date_range.overlap?(requested_range)
            # remove the room from the list of available_rooms
            available_rooms.delete(reservation.room_number)
          end
        end
        
      end
      
      return available_rooms
      
    end
    
  end
  
end