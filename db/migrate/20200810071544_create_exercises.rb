class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.text :name
      t.text :image
      t.text :descript
      t.text :link
      t.text :reps
      t.text :tips

      t.timestamps
    end
  end
end
