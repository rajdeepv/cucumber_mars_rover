class Rover
  def initialize(x, y, direction)
    @current_x = x
    @current_y = y
    @current_direction = direction
  end

  def follow_instruction(instruction)
    case instruction
    when "M"
      rover_move
    when "L"
      rover_left
    when "R"
      rover_right
    end
  end

  def current_position
    [@current_x, @current_y, @current_direction].join(' ')
  end
end

