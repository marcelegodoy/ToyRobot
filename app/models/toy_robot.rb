class ToyRobot < ApplicationRecord
  validates :x_coord, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 5 }
  validates :y_coord, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 5 }
end