# test_room.rb

require_relative 'test_helper'

describe "Initialize room" do
  
  it "creates an instance of room" do
    room = Room.new(
      room_number: 13, reservations: []
    )
    expect(room).must_be_kind_of Room
  end
  
end