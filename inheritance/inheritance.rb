class Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @size =  args[:size]
    @tape_color = args[:tape_color]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  #every bike has the same defaults
  #for tire and chain size 

  # checking "style" starts down a slippery slope
  def spares
    if style == :road 
      { chain: '10-speed',
        tire_size: '23',
        tape_color: tape_color }
    else
          { chain: '10-speed',
        tire_size: '23',
        rear_shock: rear_shock }
    end 
  end

  #Many other methods
end

bike = Bicycle.new(  style: :mountain, size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
bike.size 
bike.spares