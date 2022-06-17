class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :username
      t.string :code
      t.string :grade_name
      t.integer :grade_percentage
      t.integer :grade_value

      t.timestamps
    end
  end
end
