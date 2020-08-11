class Exercise < ApplicationRecord
  belongs_to :workout, optional: true
  belongs_to :user, optional: true
end
