require './classes/book'

describe Book do
  book = Book.new('Brave New World', 'Aldous Huxley')

  context 'should create instance of Book Class' do
    it 'returns correct title' do
      expect(book.title).to eq('Brave New World')
    end

    it 'returns correct author' do
      expect(book.author).to eq('Aldous Huxley')
    end
  end
end
