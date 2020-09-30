require_relative 'coordinate.rb'
require_relative 'compass'

class Rover
  def initialize(x, y, direction)
    @coordinate = Coordinate.new(x, y)
    @compass = Compass.new
    @compass.caliberate(direction)
  end

  def follow_instruction(instruction)
    case instruction
    when "M"
      move
    when "L"
      turn_left
    when "R"
      turn_right
    end
  end

  def turn_left
    @compass.rotate_anticlockwise
  end

  def turn_right
    @compass.rotate_clockwise
  end

  def move
    case @compass.current_direction
    when "N"
      @coordinate.increment_y
    when "S"
      @coordinate.decrement_y
    when "E"
      @coordinate.increment_x
    when "W"
      @coordinate.decrement_x
    else
      raise('Unsupported value for direction')
    end
  end

  def current_position
    [@coordinate.x, @coordinate.y, @compass.current_direction].join(' ')
  end
end