class Borrowing < ApplicationRecord
  belongs_to :book
  validates :borrower_name, presence: true
  # Additional attributes and methods can be added here
end
