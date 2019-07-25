class Owner < ApplicationRecord
    has_many :repositories

    validates :external_id, uniqueness: true
end