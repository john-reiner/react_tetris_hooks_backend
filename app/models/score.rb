class Score < ApplicationRecord
    default_scope { order(points: :desc)}
end
