Given(/^There is a rover at position "([^"]*)"$/) do |raw_position|
  sleep 3
  x, y, direction = raw_position.split(' ')
  @rover = Rover.new(x, y, direction)
end

And(/^Nasa sends the command "([^"]*)"$/) do |commands|
  commands.split(' ').each do |instruction|
    @rover.follow_instruction(instruction)
  end
end

Then(/^The rover position should be "([^"]*)"$/) do |string|
  current_position = @rover.current_position
  if current_position != string
    raise "rover did not navigate properly, current_position = #{current_position} against #{string}"
  end
end