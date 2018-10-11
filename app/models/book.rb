

class Book < ApplicationRecord

  validates_presence_of :title, :pages, :year #, :authors

  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors


  # --- Math ---

  def count_ratings
    reviews.count
  end

  def average_rating
    reviews.average(:score).to_f.round(2)
  end


  # --- Filtering ---

  # To Do - Test Me
  def self.sort_by_title
    order(:title)
  end

  # This doesn't quite work yet 
  def self.sort_by_average_rating
    books = Book.all
    books.select(:books, :'average_rating AS av_score')
    .joins(:results)
    .order(:av_score)
  end





end
