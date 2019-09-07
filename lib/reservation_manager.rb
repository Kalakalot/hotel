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
      # UGH, LOOP WITHIN A LOOP ...
      # create a new collection that sorts reservations by room number
      # initialize an array to hold available rooms
      # loop through the collection of reservations by room number
      # for each room number, compare the existing reservations against the lookup date range
      # for each existing reservation, check ...
      #     if reservation.start_date is <something> than the lookup.start_date
      #       &&
      #     if reservation.end_date is <something> than the lookup.end_date
      # if there are no overlapping dates, add the room number to the "available rooms" array
      # return array of available rooms 
      
      
      # 
      # create a data structure that lists reservations by room number
      
      
      # loop through each room number: 
      # false if one or more reservations conflict
      # true if no conflicts
      # return all room numbers that evaluate to true
    end
    
    def reservations_by_room
      # helper method to transform @all_reservations into 
      # an array of hashes, one hash per room number. Each hash
      # includes room number and reservations as an array of values.
      
      reservations_all_rooms = []
      @all_reservations.each do |reservation|
        reservations_all_rooms << {reservation.room_number => reservation.date_range}
      end
      
      return reservations_all_rooms
    end
    
  end
  
end