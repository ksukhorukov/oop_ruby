class Bicycle
  attr_reader :size, :chain, :tire_size    # <- promoted from RoadBike
  def initialize(args={})
    @size = args[:size] 
    @chain = args[:chain] 
    @tire_size = args[:tire_size]
  end

end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBike now MUST send 'super'
  end

  def spares
    { chain: '10-speed',
    tire_size: '23',
    tape_color: tape_color }
  end
end

class MountainBike < Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

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
    { chain: '10-speed',
      tire_size: '23',
      rear_shock: rear_shock }  
  end

  #Many other methods
end

road_bike = RoadBike.new( size: 'M',
                    tape_color: 'red' )
road_bike.size  # -> ""M""
mountain_bike = MountainBike.new( size: 'S',
                        front_shock:  'Manitou',
                        rear_shock:   'Fox')
mountain_bike.size # -> 'S'