Given("There is a rover at position {string}") do |raw_position|
  x, y, direction = raw_position.split(' ')
  @rover = Rover.new(x, y, direction)
end

Given("Nasa sends the command {string}") do |commands|
  commands.split(' ').each do |instruction|
    p instruction
    @rover.follow_instruction(instruction)
  end
end

Then("The rover position should be {string}") do |string|
  current_position = @rover.current_position
  if current_position != string
    raise "rover did not navigate properly, current_position = #{current_position} against #{string}"
  end
end