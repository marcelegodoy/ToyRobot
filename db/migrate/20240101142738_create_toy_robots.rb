class CreateToyRobots < ActiveRecord::Migration[7.0]
  def change
    create_table :toy_robots do |t|
      t.integer :x_coord
      t.integer :y_coord
      t.string :facing

      t.timestamps
    end
  end
end
