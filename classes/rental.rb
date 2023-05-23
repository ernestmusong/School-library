class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << person.add_person_to_book
    person.rentals << book.add_book_to_person
    # person.rentals << self
    # book.rentals << self
  end

  def to_h_rental 
    {date: @date, book: @book.to_h_rental, person: @person.to_h_rental}
  end

end
