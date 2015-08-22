
module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date) 
    schedule.scheduled?(self, start_date, end_date)
  end
  # includers may override
  def lead_days
     0
  end 
end

class Schedule
  def scheduled?(schedulable, start_date, end_date)
        puts "This #{schedulable.class} " +
              "is not scheduled\n" +
              "  between #{start_date} and #{end_date}"
        false
  end 
end

class Bicycle

  include Schedulable

  attr_reader :schedule, :size, :chain, :tire_size    # <- promoted from RoadBike
  def initialize(args={})

    @schedule = args[:schedule] || Schedule.new

    @size = args[:size] 
    @chain = args[:chain]  || default_chain

    post_initialize(args)
  end

  # Return the number of lead_days before a bicycle # can be scheduled.
  def lead_days
    1
  end

  def post_initialize(args) # and implements this nil
    nil
  end

  def default_chain
    '10-speed'
  end

  def spares
    { chain: chain, tire_size: tire_size }.merge(local_spares)
  end 

  def local_spares
    {}
  end
end


require 'date'
starting = Date.parse("2015/09/04") 
ending = Date.parse("2015/09/10")
b = Bicycle.new 
b.schedulable?(starting, ending)
# This Bicycle is not scheduled
# between 2015-09-03 and 2015-09-10 # => true