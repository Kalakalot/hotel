# lib/reservation.rb

class Reservation

  attr_reader :start_date, :end_date, :room_number
  
  def initialize(start_date:, end_date:, room_number: nil) 
    @start_date = start_date
    @end_date = end_date
    @room_number = room_number
  end
  
end


