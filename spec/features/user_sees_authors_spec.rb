require 'rails_helper'

describe 'author index' do
  it 'user can see all authors' do
    user1 = User.create(name: "User 1")
    user2 = User.create(name: "User 2")
    author_1 = Author.create(name: "Author_1")
    book = author_1.books.create(title: "Title 1", pages: 100, year:2000)
    review1 = book.reviews.create(title: "Review 1", description: "description 1", score: 3, user_id: user1.id)
    review2 = book.reviews.create(title: "Review 2", description: "description 2", score: 4, user_id: user2.id)

    visit '/authors/1'

    expect(page).to have_content(author_1.name)
    expect(page).to have_content("Published Work: #{book.title}")
    expect(page).to have_content("Pages: #{book.pages}")
  end

  it 'user can top rated view for authors book' do
    user1 = User.create(name: "User 1")
    user2 = User.create(name: "User 2")
    user3 = User.create(name: "User 3")
    author_1 = Author.create(name: "Author_1")
    book = author_1.books.create(title: "Title 1", pages: 100, year:2000)
    review1 = book.reviews.create(title: "Review 1", description: "description 1", score: 3, user_id: user1.id)
    review2 = book.reviews.create(title: "Review 2", description: "description 2", score: 5, user_id: user2.id)
    review3 = book.reviews.create(title: "Review 2", description: "description 2", score: 4, user_id: user3.id)

    visit '/authors/2'

    expect(page).to have_content(author_1.name)
    expect(page).to have_content("Published Work: #{book.title}")
    expect(page).to have_content("Pages: #{book.pages}")
    expect(page).to have_content("Great Review: #{review2.title}")
    expect(page).to have_content("Rating: #{review2.score}")
    expect(page).to have_content("User: #{user2.name}")
  end


end