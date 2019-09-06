# date_range_test.rb

require_relative "test_helper"

describe Hotel::DateRange do
  describe "Constructor" do
    it "can be initialized with two dates" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      
      range = Hotel::DateRange.new(start_date, end_date)
      
      expect(range.start_date).must_equal start_date
      expect(range.end_date).must_equal end_date
    end
    
    it "dates are instances of Date class" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      
      range = Hotel::DateRange.new(start_date, end_date)
      
      expect(range.start_date).must_be_kind_of Date
      expect(range.end_date).must_be_kind_of Date
    end
    
    it "creates a new DateRange object" do
      start_date = Date.new(2017, 01, 01)
      end_date = start_date + 3
      
      range = Hotel::DateRange.new(start_date, end_date)
      
      expect(range).must_be_kind_of Hotel::DateRange
    end
    
    it "raises an error if the start date is after the end date" do
      start_date = Date.new(2021, 01, 01)
      end_date = start_date - 3
            
      expect{ Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
    
    it "raises an error if the start and end dates are the same" do
      start_date = Date.new(2021, 01, 01)
      end_date = Date.new(2021, 01, 01)
            
      expect{ Hotel::DateRange.new(start_date, end_date) }.must_raise ArgumentError
    end
        
  end
  
  # describe "Overlap?" do
  #   before do
  #     start_date = Date.new(2017, 01, 01)
  #     end_date = start_date + 3
  
  #     @range = Hotel::DateRange.new(start_date, end_date)
  #   end
  
  #   it "returns true for the same range" do
  #     start_date = @range.start_date
  #     end_date = @range.end_date
  #     test_range = Hotel::DateRange.new(start_date, end_date)
  
  #     expect(@range.overlap?(test_range)).must_equal true
  #   end
  
  # xit "returns true for a contained range" do
  # end
  
  # xit "returns true for a range that overlaps in front" do
  # end
  
  # xit "returns true for a range that overlaps in the back" do
  # end
  
  # xit "returns true for a containing range" do
  # end
  
  # xit "returns false for a range starting on the end_date date" do
  # end
  
  # xit "returns false for a range ending on the start_date date" do
  # end
  
  # xit "returns false for a range completely before" do
  # end
  
  # xit "returns false for a date completely after" do
  # end
  # end
  
  
  # xdescribe "include?" do
  #   it "reutrns false if the date is clearly out" do
  #   end
  
  #   it "returns true for dates in the range" do
  #   end
  
  #   it "returns false for the end_date date" do
  #   end
  # end
  
  # xdescribe "nights" do
  #   it "returns the correct number of nights" do
  #   end
  # end
end
