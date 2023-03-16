require 'rspec'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'long name that needs trimming') }
  subject(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable instance variable' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'trims the result of calling correct_name on the nameable object to a maximum length of 10 characters' do
      expect(decorator.correct_name).to eq('long name t')
    end
  end
end