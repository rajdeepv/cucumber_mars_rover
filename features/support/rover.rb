require_relative 'compass'

class Rover
  def initialize(x, y, direction)
    @current_x = x.to_i
    @current_y = y.to_i
    @compass = Compass.new
    @compass.caliberate(direction)
  end

  def follow_instruction(instruction)
    case instruction
    when "M"
      rover_move
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

  def rover_move
    case @compass.current_direction
    when "N"
      @current_y = @current_y + 1
    when "S"
      @current_y = @current_y - 1
    when "E"
      @current_x = @current_x + 1
    when "W"
      @current_x = @current_x - 1
    else
      raise('Unsupported value for direction')
    end
  end

  def current_position
    [@current_x, @current_y, @compass.current_direction].join(' ')
  end
end