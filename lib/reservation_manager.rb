# lib/reservation_manager.rb
module Hotel
  
  class ReservationManager
    def Initialize
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
    
    def reserve_room(start_date, end_date, room_number)
      
      # define the variables needed for a new reservation
      start_date = Date.parse("2020-02-03")
      end_date = Date.parse("2020-02-05")
      room_number = rand(1..20)
      
      # instantitate the new reservation
      reservation = Hotel::Reservation.new(
        start_date,
        end_date,
        room_number
      )

      # add new reservation to list of all reservations
      # @all_reservations << reservation
      
      return reservation
    end
    
        
    def reservations(date)
      # reservations_array = []
      # # reservations.each do
      # #   if date >= 
      # #   end
      
      
      #   # start_date = Date.parse("2020-01-20")
      #   #     end_date = Date.parse("2020-01-23")
      #   #     room_number = rand(1..20)
      #   #     reservation_3 = Hotel::Reservation.new(start_date, end_date, room_number)
      
      
      #   return reservations_array
    end
    
  end
end