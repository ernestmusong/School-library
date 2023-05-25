require './classes/teacher'

describe Teacher do
  context '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(name: 'John', age: 30, specialization: 'Math')
      expect(teacher.can_use_services?).to be(true)
    end
  end

  context '#initialize' do
    it 'sets the name, age and specialization' do
      teacher = Teacher.new(name: 'John', age: 30, specialization: 'Math')
      expect(teacher.name).to eq('John')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
    end
  end
end