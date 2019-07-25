class Repository < ApplicationRecord
    belongs_to :owner
    
    validates :github_id, uniqueness: true
end
