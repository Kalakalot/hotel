# lib/room.rb

class Room
  
attr_reader :room_number, :reservations

  def initialize(room_number:, reservations: nil)
    @room_number = room_number,
    @reservations = []
  end
  
  def self.all
    # returns a list of all rooms in the hotel
  end
  
  def room_free?
    # returns true if room is available for dates provided
  end
  
  
end
