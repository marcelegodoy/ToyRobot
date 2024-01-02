class ToyRobotService
  FACINGS = ["north", "east", "south", "west"].freeze

  def initialize(robot)
    @robot = robot
  end

  def place(x_coord, y_coord, facing)
    @robot.update(x_coord: x_coord, y_coord: y_coord, facing: facing)
  end

  def move
    case @robot.facing
    when 'north'
      @robot.update(y_coord: @robot.y_coord + 1) if @robot.y_coord < 4
    when 'east'
      @robot.update(x_coord: @robot.x_coord + 1) if @robot.x_coord < 4
    when 'south'
      @robot.update(y_coord: @robot.y_coord - 1) if @robot.y_coord > 0
    when 'west'
      @robot.update(x_coord: @robot.x_coord - 1) if @robot.x_coord > 0
    end
  end

  def rotate(direction)
    current_index = FACINGS.index(@robot.facing)
  
    direction_mapping = {
      'left' => -1,
      'right' => 1
    }
  
    new_index = (current_index + direction_mapping[direction]) % FACINGS.length
  
    @robot.update(facing: FACINGS[new_index])
  end

  def current_robot
    @robot
  end
end