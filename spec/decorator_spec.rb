require './decorators/decorator'

describe Decorator do
  name = Decorator.new('aldous_Huxley')
  context 'given an instance' do
    it 'returns correct title' do
      expect(name.nameable).to eq('aldous_Huxley')
    end
    it 'returns correct nameable' do
      expect(name.correct_name).to eq('aldous_Huxley')
    end
  end
end
