class Station
  attr_reader :zone, :name
  
  def initialize(information)
    @name = information[:name]
    @zone = information[:zone]
  end
end