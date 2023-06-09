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

  def to_h
    { title: @title, author: @author, rentals: @rentals.map(&:to_h) }
  end
end
