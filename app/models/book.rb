class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  # Additional attributes and methods can be added here
end
