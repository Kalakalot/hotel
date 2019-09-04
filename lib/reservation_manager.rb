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
      
      # start_date and end_date should be instances of class Date
      return Reservation.new(start_date, end_date, nil)
    end
    
    def reservations(date)
      return []
    end
  end
  
end