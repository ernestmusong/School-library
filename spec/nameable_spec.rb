require './classes/nameable'

describe Nameable do
  name = Nameable.new
  context 'run class method' do
    it 'raises an error' do
      expect { name.correct_name }.to raise_error
    end
  end
end
