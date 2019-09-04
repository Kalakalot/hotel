# lib/room.rb

class Room
  
  attr_reader :room_number, :reservations
  
  VALID_ROOM_NUMBERS = (1..20)
  
  def initialize(room_number:, reservations: nil)
    @room_number = room_number
    
    # create an empty array to hold reservations
    @reservations = []
    
  end
  
  # def validate_room_number
  #   # validate room number 
  #   if !VALID_ROOM_NUMBERS.include?(room_number) 
  #     raise ArgumentError.new("Oops, #{room_number} is not a valid room number. Please provide a number between 1 and 20.")
  #   end
  
  # end
  
  def self.all
    # returns a list of all rooms in the hotel
    all_rooms = []
    VALID_ROOM_NUMBERS.each do |room|
      all_rooms << "Room #{room}"
    end  
    return all_rooms
  end
  
  
  def room_free?
    # returns true if room is available for dates provided
  end
  
  
end
