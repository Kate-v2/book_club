

class Book < ApplicationRecord

  validates_presence_of :title, :pages, :year #, :authors

  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

end
