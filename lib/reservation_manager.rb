# lib/reservation_manager.rb
module Hotel
  
  class ReservationManager
    
    def rooms
      valid_rooms = (1..20)
      room_list = []
      valid_rooms.each do |number|
        room_list << "Room #{number}"
      end
      return room_list
    end
    
    def reserve_room(start_date, end_date)
      
      # define the variables needed for a new reservation
      provided_start = "2020-02-03"
      provided_end = "2020-02-05"
      start_date = Date.parse(provided_start)
      end_date = Date.parse(provided_end)
      room_number = rand(1..20)

      # instantitate the new reservation
      new_reservation = Reservation.new(
        start_date: start_date,
        end_date: end_date, 
        room_number: room_number
      )
      # take in start_date and end_date and return a new instance of class Reservation
      # start_date and end_date should be instances of class Date
      return new_reservation
    end
    
    def reservations(date)
      return []
    end
  end
  
end