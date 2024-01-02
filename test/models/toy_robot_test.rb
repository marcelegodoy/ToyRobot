require "test_helper"

class ToyRobotTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    toy_robot = ToyRobot.new(x_coord: 1, y_coord: 2, facing: 'north')
    assert toy_robot.valid?
  end

  test "should not be valid without x coordinate" do
    toy_robot = ToyRobot.new(y_coord: 2, facing: 'north')
    assert_not toy_robot.valid?
  end

  test "should not be valid without y coordinate" do
    toy_robot = ToyRobot.new(x_coord: 1, facing: 'north')
    assert_not toy_robot.valid?
  end

  test "should not be valid without facing direction" do
    toy_robot = ToyRobot.new(x_coord: 1, y_coord: 2)
    assert_not toy_robot.valid?
  end

  test "x coordinate should be an integer" do
    toy_robot = ToyRobot.new(x_coord: 'invalid', y_coord: 2, facing: 'north')
    assert_not toy_robot.valid?
  end

  test "y coordinate should be an integer" do
    toy_robot = ToyRobot.new(x_coord: 1, y_coord: 'invalid', facing: 'north')
    assert_not toy_robot.valid?
  end
end
