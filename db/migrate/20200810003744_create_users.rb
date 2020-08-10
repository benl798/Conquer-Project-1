class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.date :dob
      t.text :sex
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :target_weight
      t.text :bio
      t.text :goal
      t.text :email

      t.timestamps
    end
  end
end
