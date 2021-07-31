class Review < ApplicationRecord
    belongs_to :user
    belongs_to :drink
    validates :star, presence: true
    validates :body, presence: true
end
