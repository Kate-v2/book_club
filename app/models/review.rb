
class Review < ApplicationRecord

  validates_presence_of :title, :description, :score, :book_id, :user_id

  belongs_to :book
  belongs_to :user

end
