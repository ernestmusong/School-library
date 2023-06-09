require_relative 'student'
require_relative 'person'
require_relative 'book'
require_relative 'teacher'
require_relative 'rental'

require 'json'

class App
  def initialize
    @people = JSON.parse(File.read('./data/people.json')) || []
    @books = JSON.parse(File.read('./data/books.json')) || []
    @rentals = JSON.parse(File.read('./data/rentals.json')) || []
  end

  def list_books
    @books = JSON.parse(File.read('./data/books.json')) if File.exist?('./data/books.json')
    if @books.empty?
      puts 'There is no book.'
      puts "Please choose an option by entering a number!\n"
      return
    end
    @books.each do |book|
      puts "Title: #{book['title']} , Author: #{book['author']}"
    end
  end

  def list_people
    @people = JSON.parse(File.read('./data/people.json')) if File.exist?('./data/people.json')
    if @people.empty?
      puts 'There are no people.'
      puts "Please choose an option by entering a number!\n"
      return
    end
    @people.each do |p|
      puts "[#{p['class']}] Name: #{p['name']}, ID: #{p['id']}, Age: #{p['age']}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp.to_i

    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input, person not created'
      puts "Please choose an option by entering a number!\n"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]:  '
    permission = gets.chomp.downcase
    student = Student.new(name: name, age: age, parent_permission: permission).to_h
    @people << student.merge!(class: 'Student')
    File.write('./data/people.json', JSON.generate(@people))
    puts "Student created successfully!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_i
    print 'Specialization:  '
    specialization = gets.chomp
    teacher = Teacher.new(name: name, age: age, specialization: specialization).to_h
    @people << teacher.merge!(class: 'Teacher')
    File.write('./data/people.json', JSON.generate(@people))
    puts "Teacher created successfully!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author).to_h
    @books << book
    File.write('./data/books.json', JSON.generate(@books))
    puts "Book created successfuly!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      date = gets.chomp
      @rentals << Rental.new(date, @books[book_index], @people[person_index]).to_h
      File.write('./data/rentals.json', JSON.generate(@rentals))
      puts "Rental created successfully\n\n"
    end
  end

  def list_rentals
    @rentals = JSON.parse(File.read('./data/rentals.json')) if File.exist?('./data/rentals.json')

    if @rentals.empty?
      p 'There are currently no rentals.'
      return
    end

    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental['person']['id'] == id }

    if rentals.empty?
      puts 'There are currently no rentals for this person!'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
      end
    end
    puts "Please choose an option by entering a number!\n"
  end
end
