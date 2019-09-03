# test_room.rb

require_relative 'test_helper'

describe "Initialize room" do

  it "creates an instance of room" do
    room = Room.new(
      room_number: 13
    )
    expect(room).must_be_kind_of Room
  end
  
  it "keeps track of room number" do
    room = Room.new(
      room_number: 13
    )
    room.must_respond_to :room_number
    expect(room.room_number).must_equal 13
  end

  it "creates an empty array for reservations" do
    room = Room.new(
      room_number: 13
    )
    expect(room.reservations).must_be_kind_of Array
    expect(room.reservations.length).must_equal 0
  end
  
end


# describe "self.all" do
#   it "returns a list of all the rooms in the hotel" do 
#     room_1 = Room.new(
#       room_number: 1, reservations: []
#     )
#     room_2 = Room.new(
#       room_number: 2, reservations: []
#     )
#     room_3 = Room.new(
#       room_number: 3, reservations: []
#     )
#     room_4 = Room.new(
#       room_number: 4, reservations: []
#     )
#     room_5 = Room.new(
#       room_number: 5, reservations: []
#     )
#     room_6 = Room.new(
#       room_number: 6, reservations: []
#     )
#     room_7 = Room.new(
#       room_number: 7, reservations: []
#     )
#     room_8 = Room.new(
#       room_number: 8, reservations: []
#     )
#     room_9 = Room.new(
#       room_number: 9, reservations: []
#     )
#     room_10 = Room.new(
#       room_number: 10, reservations: []
#     )
#     room_11 = Room.new(
#       room_number: 11, reservations: []
#     )
#     room_12 = Room.new(
#       room_number: 12, reservations: []
#     )
#     room_13 = Room.new(
#       room_number: 13, reservations: []
#     )
#     room_14 = Room.new(
#       room_number: 14, reservations: []
#     )
#     room_15 = Room.new(
#       room_number: 15, reservations: []
#     )
#     room_16 = Room.new(
#       room_number: 16, reservations: []
#     )
#     room_17 = Room.new(
#       room_number: 17, reservations: []
#     )
#     room_18 = Room.new(
#       room_number: 18, reservations: []
#     )
#     room_19 = Room.new(
#       room_number: 19, reservations: []
#     )
#     room_20 = Room.new(
#       room_number: 20, reservations: []
#     )
#     expect(room.all.length).must_equal 20
#   end

# end