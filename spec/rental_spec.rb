require './classes/rental'

RSpec.describe Rental do
  let(:date) { double("2020-01-01") }
  let(:book) { double("book") }
  let(:person) { double("person") }
  let(:rental) { Rental.new(date, book, person) }

  describe "#initialize" do
    it "creates a new Rental instance with a date, book, and person" do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end

  describe "#to_h" do
    it "returns a hash representation of the rental" do
      book_hash = { title: "Book Title", author: "Book Author" }
      person_hash = { name: "John Doe", age: 30 }
      allow(book).to receive(:to_h).and_return(book_hash)
      allow(person).to receive(:to_h).and_return(person_hash)

      expected_hash = { date: date, book: book_hash, person: person_hash }
      expect(rental.to_h).to eq(expected_hash)
    end
  end
end
