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
  end
  
  # def overlap?

  #   return false
  # end
  
  # def include?(date)
  #   return false
  # end
  
  # def nights 
  #   return 3
  # end
  
  #   end
end