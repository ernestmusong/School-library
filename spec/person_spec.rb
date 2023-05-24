require './classes/person'

describe Person do
    context '#initialize' do
      it 'should generate a unique id for each person' do
        person1 = Person.new(name: 'Frank', age: 21, parent_permission: false)
        person2 = Person.new(name: 'Emmanuel', age: 22, parent_permission: true)
        expect(person1.id).not_to eq(person2.id)
      end
    end
  
    context '#of_age?' do
      it 'should return true if the person is 18 or older' do
        person = Person.new(name: 'Louis', age: 21, parent_permission: false)
        expect(person.of_age?).to be(true)
      end
  
      it 'should return false if the person is under 18' do
        person = Person.new(name: 'Musong', age: 17, parent_permission: false)
        expect(person.of_age?).to be(false)
      end
    end
  
    context '#can_use_services?' do
      it 'should return true if the person is of age or has parent permission' do
        person = Person.new(name: 'Ernest', age: 21, parent_permission: false)
        expect(person.can_use_services?).to be(true)
  
        person = Person.new(name: 'Akeh', age: 17, parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end
  
      it 'should return false if the person is under age and does not have parent permission' do
        person = Person.new(name: 'Derick', age: 17, parent_permission: false)
        expect(person.can_use_services?).to be(false)
      end
    end
  
    context '#to_h' do
      it 'should return a hash representation of the person' do
        person = Person.new(name: 'Omarion', age: 21, parent_permission: false)
  
        expected_hash = {
          id: person.id,
          name: person.name,
          age: person.age,
          rentals: person.rentals.map(&:to_h)
        }
  
        expect(person.to_h).to eq(expected_hash)
      end
    end
  end