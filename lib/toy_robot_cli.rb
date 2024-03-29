require_relative '../config/environment'
require_relative '../app/models/toy_robot'

class ToyRobotCLI
  def initialize
    @toy_robot_service = ToyRobotService.new(ToyRobot.find_or_create_by(default_params))
  end

  def start
    puts 'Toy Robot Simulator - Command Line Interface'
    puts '---'
    puts 'These are some command examples of how you can change the robot position:'
    puts 'PLACE x,y,DIRECTION - Define a new position for robot'
    puts 'MOVE - Move to the direction it is facing'
    puts 'LEFT - Turn the robot around to left'
    puts 'RIGHT - Turn the robot around to right'
    puts 'REPORT - Show where the robot is'
    puts 'EXIT - Close the simulation'

    loop do
      print '> '
      command = gets.chomp.upcase

      case command
      when /^PLACE (\d+),(\d+),(NORTH|SOUTH|EAST|WEST)$/
        x, y, facing = $1.to_i, $2.to_i, $3
        @toy_robot_service.place(x, y, facing)
        puts "#{@toy_robot_service.current_robot.x_coord},#{@toy_robot_service.current_robot.y_coord}#{@toy_robot_service.current_robot.facing}"
        puts "The robot is now at position x: #{@toy_robot_service.current_robot.x_coord}, y: #{@toy_robot_service.current_robot.y_coord} and facing: #{@toy_robot_service.current_robot.facing}"
      when 'MOVE'
        @toy_robot_service.move
        puts "#{@toy_robot_service.current_robot.x_coord},#{@toy_robot_service.current_robot.y_coord}#{@toy_robot_service.current_robot.facing}"
        puts "The robot moved to position x: #{@toy_robot_service.current_robot.x_coord}, y: #{@toy_robot_service.current_robot.y_coord} and facing: #{@toy_robot_service.current_robot.facing}"
      when 'LEFT'
        @toy_robot_service.rotate('left')
        puts "#{@toy_robot_service.current_robot.x_coord},#{@toy_robot_service.current_robot.y_coord}#{@toy_robot_service.current_robot.facing}"
        puts "The rotated to left and is now at position x: #{@toy_robot_service.current_robot.x_coord}, y: #{@toy_robot_service.current_robot.y_coord} and facing: #{@toy_robot_service.current_robot.facing}"
      when 'RIGHT'
        @toy_robot_service.rotate('right')
        puts "#{@toy_robot_service.current_robot.x_coord},#{@toy_robot_service.current_robot.y_coord}#{@toy_robot_service.current_robot.facing}"
        puts "The rotated to right and is now at position x: #{@toy_robot_service.current_robot.x_coord}, y: #{@toy_robot_service.current_robot.y_coord} and facing: #{@toy_robot_service.current_robot.facing}"
      when 'REPORT'
        puts "#{@toy_robot_service.current_robot.x_coord},#{@toy_robot_service.current_robot.y_coord}#{@toy_robot_service.current_robot.facing}"
        puts "The robot is now at position x: #{@toy_robot_service.current_robot.x_coord}, y: #{@toy_robot_service.current_robot.y_coord} and facing: #{@toy_robot_service.current_robot.facing}"
      when 'EXIT'
        puts 'Exiting Toy Robot Simulator. Goodbye!'
        break
      else
        puts 'Invalid command. Please try again.'
      end
    end
  end

  private

  def default_params
    { x_coord: 0, y_coord: 0, facing: 'south' }
  end
end

ToyRobotCLI.new.start if __FILE__ == $PROGRAM_NAME