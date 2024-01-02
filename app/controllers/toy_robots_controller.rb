class ToyRobotsController < ApplicationController  

  def index
    @robot = ToyRobot.first_or_create(x_coord: 0, y_coord: 0, facing: 'south')
    @current_position = { x_coord: @robot.x_coord, y_coord: @robot.y_coord, facing: @robot.facing }
  end

  def execute_command
    @robot = ToyRobot.first_or_initialize
    service = ToyRobotService.new(@robot)

    command = params[:command].upcase

    case command
    when /^PLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$/
      service.place($1.to_i, $2.to_i, $3.downcase)
    when 'MOVE'
      service.move
    when 'LEFT'
      service.rotate('left')
    when 'RIGHT'
      service.rotate('right')
    when 'REPORT'
      flash[:notice] = "The robot is at x: #{@robot.x_coord}, y: #{@robot.y_coord} and facing: #{@robot.facing}"
    else
      flash[:notice] = "Invalid command: #{params[:command]}"
    end

    @current_position = { x_coord: @robot.x_coord, y_coord: @robot.y_coord, facing: @robot.facing }
    redirect_to root_path(current_position: @current_position)
  end
end

