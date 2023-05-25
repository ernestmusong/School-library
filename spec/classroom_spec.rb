require './classes/classroom'

RSpec.describe Classroom do
  let(:classroom_label) { 'Mathematics' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { double('student') }

  describe '#initialize' do
    it 'creates a new Classroom instance with a label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes students as an empty array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    context 'when student is not already in the classroom' do
      it 'sets the classroom for the student' do
        expect(student).to receive(:classroom=).with(classroom)
        classroom.add_student(student)
      end
    end
  end
end
