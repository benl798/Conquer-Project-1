class CreateWorkoutsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts_users do |t|
      t.integer :user_id
      t.integer :workout_id
    end
  end
end
