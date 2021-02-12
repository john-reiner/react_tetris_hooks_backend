class Score < ApplicationRecord
    belongs_to :user
    default_scope { order(points: :desc)}
end
