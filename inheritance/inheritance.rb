class Bicycle
  attr_reader :size, :chain, :tire_size    # <- promoted from RoadBike
  def initialize(args={})
    @size = args[:size] 
    @chain = args[:chain]  || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size 
    raise NotImplementedError, 
        "This #{self.class} cannot respond to:"
  end

  def spares
    { chain: chain, tire_size: tire_size }
  end 
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBike now MUST send 'super'
  end

  def spares
    super.merge({ tape_color: tape_color })
  end

  def default_tire_size 
    '23'
  end

end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  #every bike has the same defaults
  #for tire and chain size 

  # checking "style" starts down a slippery slope
  def spares
      super.merge({ rear_shock: rear_shock })
  end

  def default_tire_size 
    '2.1'
  end
end

class RecumbentBike < Bicycle
end

road_bike = RoadBike.new( size: 'M',
                    tape_color: 'red' )
road_bike.size  # -> ""M""
mountain_bike = MountainBike.new( size: 'S',
                        front_shock:  'Manitou',
                        rear_shock:   'Fox')
mountain_bike.size # -> 'S'
bent = RecumbentBike.new