module UI
  def options_input(app)
    input = gets.chomp
    case input.to_i
    when 1 then app.list_books
    when 2 then app.list_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals
    when 7
      puts 'Thank you for using School Library App!'
      exit
    end
  end
end
