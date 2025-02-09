# lib/date_range.rb

module Hotel
  class DateRange
    
    attr_accessor :start_date, :end_date
    
    def initialize(start_date, end_date)
      
      @start_date = start_date
      @end_date = end_date
      
      if end_date < start_date
        raise ArgumentError.new(
          "The start date must be before the end date."
        )
      elsif start_date == end_date
        raise ArgumentError.new(
          "Please provide an end date that is at least one day later than your start date."
        )  
      end
      
    end
    
    def overlap?(test_range)
      # takes in a test_range (reservation query?) and returns true 
      # if it overlaps with an instance of DateRange
      
      instance_range = self.start_date .. self.end_date
      comparison_range = test_range.start_date .. test_range.end_date
      
      # returns true for the same range
      if instance_range == comparison_range
        return true
        # returns true for a contained range
      elsif test_range.start_date > self.start_date && test_range.end_date < self.end_date 
        return true
        # returns true for a range that overlaps in front
      elsif test_range.start_date < self.start_date && test_range.end_date != self.start_date && test_range.end_date > self.start_date
        return true
        # returns true for a range that overlaps in the back
      elsif test_range.end_date > self.end_date && test_range.start_date != self.end_date && test_range.start_date < self.end_date
        return true
        # returns false for a range starting on the end date
      elsif test_range.start_date == self.end_date
        return false
        # returns false for a range ending on the start date
      elsif test_range.end_date == self.start_date
        return false
        # returns false for a date completely before
      elsif test_range.end_date < self.start_date
        return false
        # returns false for a date completely after
      elsif test_range.start_date > self.end_date
        return false
      end 
      
    end
    
    def include?(date)
      # takes in a date and returns true if the date is part of the range, otherwise returns false
      if date < self.start_date || date >= self.end_date 
        return false
      elsif date > self.start_date && date < self.end_date
        return true
      end
    end
    
    def nights 
      # returns number of nights for an instance of DateRange
      return self.end_date - self.start_date
    end
    
  end
end