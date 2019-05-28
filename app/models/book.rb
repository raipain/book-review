class Book < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories
    has_many :reviews

    validates :title, presence: true
    validates :author, presence: true
    validates :description, length: { in: 6..2000 }
    validates :user_id, presence: true

end
