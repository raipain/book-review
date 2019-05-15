class Book < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reviews

    validates :title, presence: true
    validates :author, presence: true
    validates :description, length: { in: 6..2000 }
    validates :category_id, presence: true
    validates :user_id, presence: true

end
