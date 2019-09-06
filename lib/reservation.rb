# lib/reservation.rb

module Hotel
  class Reservation
    
    attr_reader :date_range, :room_number
    
    def initialize(date_range, room_number) 
      @date_range = date_range
      @room_number = room_number
    end

    def cost
      cost_per_night = 200
      nights = date_range.end_date - date_range.start_date
      total = cost_per_night * nights   
      return total
    end
    
  end

end
  