class CreateCourseSection < ActiveRecord::Migration[5.1]
  def change
    create_table :course_sections do |t|
      t.string :name
      t.integer :enroll_code
      t.belongs_to :course
    end
  end
end
