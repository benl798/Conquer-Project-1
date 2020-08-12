class User < ApplicationRecord

  has_many :exercises

  has_many :workouts #one-to-many

  # has_and_belongs_to_many :liked_workouts, class_name: 'Workout' #many to many for like/fave. The method name 'workouts' is already taken by the has many association above so we need to rename our HABTM association for liking workouts. We can call it whatever we want, i.e 'liked_workouts' but then we have to tell ActiveRecord what the other class/model is for the other end of this association, since it's no longer possible to work it out automatically from the name.

  has_secure_password # includes some password validation

  # When creating a User, the 'name' field must be present, i.e. not blank
  validates :name, length: { minimum: 2 }

  validates :email, presence: true, uniqueness: true
end
