# lib/room.rb

class Room
  
attr_reader :room_number, :reservations

  def initialize(room_number:, reservations: nil)
    @room_number = room_number
    @reservations = []
  end
  
  def self.all
    # # returns a list of all rooms in the hotel
    # rooms = 
    
    
    # []
    # # put all the rooms in the rooms array
    # # where does the list of all rooms come from? Do I need to hardcode it?



    # return rooms
  end
  
  def room_free?
    # returns true if room is available for dates provided
  end
  
  
end
