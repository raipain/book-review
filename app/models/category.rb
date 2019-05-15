class Category < ApplicationRecord
    has_many :books

    validates :name, presence: true
    validates_associated :books  
end
