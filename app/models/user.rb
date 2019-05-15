class User < ApplicationRecord
  has_many :books
  has_many :reviews

  validates :email, presence: true
  validates :password, length: { in: 6..20 }
  validates_associated :books

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
