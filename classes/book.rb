class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
    rental.book = self
  end

  def add_book_to_person
    { title: @title, author: @author}
  end
  
  def to_h_rental
    { title: @title, author: @author, rentals: @rentals }
  end
end
