require './decorators/capitalize_decorator'

describe Decorator do
  name = CapitalizeDecorator.new('aldous_Huxley')

  it 'returns correct title' do 
    expect(name.nameable).to eq('aldous_Huxley')
  end
  it 'capitalize the input' do 
    expect(name.correct_name.capitalize).to eq('Aldous_huxley')
  end
end