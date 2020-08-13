class Workout < ApplicationRecord
  has_and_belongs_to_many :exercises

  # has_and_belongs_to_many :liked_by_users, class_name: 'User' #many to many for like/fave

  belongs_to :user, optional: true
  has_many :comments

  validates :workout_type, presence:true

end
