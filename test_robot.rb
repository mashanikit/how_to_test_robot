require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_vintage_robot_needing_repairs_sent_to_station_1
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.vintage_model = true
    @robot.foreign_model = true
    assert @robot.station == 1

  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = true
    assert @robot.station == 1
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.vintage_model = true
    assert @robot.station == 2


  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    @robot = Robot.new
    @robot.needs_repairs = true
    assert @robot.station == 3

  end

  def test_that_robot_in_good_condition_sent_to_station_4
    @robot = Robot.new
    assert @robot.station == 4
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
  @robot = Robot.new
  @robot.todos = []
  assert @robot.prioritize_tasks == -1
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
  @robot = Robot.new
  @robot.todos = [2,3,1]
  assert @robot.prioritize_tasks == 3


  end

  def test_workday_on_day_off_returns_false
    @robot = Robot.new
    @robot.day_off = "Monday"
    refute @robot.workday?("Monday")
  end

  def test_workday_not_day_off_returns_true
    @robot = Robot.new
    @robot.day_off = "Monday"
    assert @robot.workday?("Tuesday")
  end

end
