class Workout < ApplicationRecord
  has_many :exercises
  belongs_to :users, optional: true
end
