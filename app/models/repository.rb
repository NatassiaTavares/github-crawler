class Repository < ApplicationRecord
    validates :github_id, uniqueness: true
end
