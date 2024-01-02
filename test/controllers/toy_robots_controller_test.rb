require "test_helper"

class ToyRobotsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @robot = ToyRobot.first_or_create(x_coord: 1, y_coord: 1, facing: 'south')
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_not_nil assigns(:robot)
    assert_template :index
  end

  test "should execute PLACE command" do
    post execute_command_path, params: { command: 'PLACE 1,2,EAST' }
    assert_equal 1, assigns(:robot).x_coord
    assert_equal 2, assigns(:robot).y_coord
    assert_equal 'east', assigns(:robot).facing
  end

  test "should execute MOVE command" do
    post execute_command_path, params: { command: 'MOVE' }
    assert_equal 1, assigns(:robot).x_coord
    assert_equal 0, assigns(:robot).y_coord
    assert_equal 'south', assigns(:robot).facing
  end

  test "should execute LEFT command" do
    post execute_command_path, params: { command: 'LEFT' }
    assert_equal 1, assigns(:robot).x_coord
    assert_equal 1, assigns(:robot).y_coord
    assert_equal 'east', assigns(:robot).facing
  end

  test "should execute RIGHT command" do
    post execute_command_path, params: { command: 'RIGHT' }
    assert_equal 1, assigns(:robot).x_coord
    assert_equal 1, assigns(:robot).y_coord
    assert_equal 'west', assigns(:robot).facing
  end

  test "should execute REPORT command" do
    post execute_command_path, params: { command: 'REPORT' }
    assert_equal "The robot is at x: 1, y: 1 and facing: south", flash[:notice]
  end

  test "should handle invalid command" do
    post execute_command_path, params: { command: 'INVALID' }
    assert_equal "Invalid command: INVALID", flash[:notice]
  end
end

